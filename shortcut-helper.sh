#!/bin/bash

DESKTOP_DIR="/usr/share/applications/"

list_desktop_files() {
    echo "Available .desktop files:"
    desktop_files=($DESKTOP_DIR/*.desktop)
    filtered_files=()
    for ((i=0; i<${#desktop_files[@]}; i++)); do
        file=${desktop_files[$i]}
        file=$(basename "$file")
        if [[ -z $1 ]] || [[ $file == *"$1"* ]]; then
            filtered_files+=("$file")
            echo "$((i+1)). $file"
        fi
    done

    if (( ${#filtered_files[@]} == 0 )); then
        echo "No matching files found."
    fi
    echo
}

edit_desktop_file() {
    file_path="$DESKTOP_DIR/$1"
    if [[ ! -f $file_path ]]; then
        echo "File $1 does not exist."
        return
    fi

    echo "Editing file: $1"
    echo "Enter new values (leave blank to keep current value):"
    IFS=$'\n' read -r -d '' -a lines < "$file_path"
    edited_lines=()
    for line in "${lines[@]}"; do
        if [[ $line == *"="* ]]; then
            key=$(echo "$line" | cut -d '=' -f 1)
            value=$(echo "$line" | cut -d '=' -f 2-)
            read -p "$key [$value]: " new_value
            new_value="${new_value//\"/\\\"}"
            if [[ -n $new_value ]]; then
                line="$key=$new_value"
            fi
        fi
        edited_lines+=("$line")
    done

    echo "${edited_lines[*]}" > "$file_path"
    echo "File edited successfully."
}

create_desktop_file() {
    echo "Creating a new .desktop file:"
    template="[Desktop Entry]
Name=
Comment=
Exec=\$APP_DIR %U
Icon=
Terminal=false
Type=Application
Encoding=UTF-8
Categories=;
Name[en_US]="

    read -p "Enter the file name (without extension): " file_name
    file_name="$file_name.desktop"
    file_path="$DESKTOP_DIR/$file_name"

    if [[ -f $file_path ]]; then
        echo "File already exists."
        return
    fi

    echo "$template" > "$file_path"
    echo "File $file_name created successfully."

    read -p "Do you want to edit the file now? (y/n): " choice
    if [[ $choice == [Yy]* ]]; then
        edit_desktop_file "$file_name"
    fi
}

remove_desktop_file() {
    file_path="$DESKTOP_DIR/$1"
    if [[ ! -f $file_path ]]; then
        echo "File $1 does not exist."
        return
    fi

    rm "$file_path"
    echo "File $1 removed successfully."
}

main() {
    if [[ $EUID -ne 0 ]]; then
        echo "Please run the script with administrative privileges (e.g., using sudo)." >&2
        exit 1
    fi

    while true; do
        echo "Options:"
        echo "1. List .desktop files"
        echo "2. Edit a .desktop file"
        echo "3. Create a new .desktop file"
        echo "4. Remove a .desktop file"
        echo "5. Exit"
        read -p "Enter your choice (1-5): " choice
        echo

        case $choice in
            1)
                read -p "Enter a keyword to filter files (leave blank for all files): " keyword
                echo
                list_desktop_files "$keyword"
                ;;
            2)
                read -p "Enter a keyword to filter files (leave blank for all files): " keyword
                echo
                list_desktop_files "$keyword"
                read -p "Enter the file number to edit: " file_number
                echo
                filtered_files=($DESKTOP_DIR/*.desktop)
                filtered_files=("${filtered_files[@]}" "${filtered_files[@]}")
                filtered_files=($(for f in "${filtered_files[@]}"; do [[ -z $keyword ]] || [[ $f == *"$keyword"* ]] && echo "$f"; done))
                filtered_files=($(for f in "${filtered_files[@]}"; do echo "$f"; done | sort))
                if (( file_number >= 1 && file_number <= ${#filtered_files[@]} )); then
                    file_name=$(basename "${filtered_files[$((file_number - 1))]}")
                    edit_desktop_file "$file_name"
                else
                    echo "Invalid file number."
                fi
                ;;
            3)
                create_desktop_file
                ;;
            4)
                read -p "Enter a keyword to filter files (leave blank for all files): " keyword
                echo
                list_desktop_files "$keyword"
                read -p "Enter the file number to remove: " file_number
                echo
                filtered_files=($DESKTOP_DIR/*.desktop)
                filtered_files=("${filtered_files[@]}" "${filtered_files[@]}")
                filtered_files=($(for f in "${filtered_files[@]}"; do [[ -z $keyword ]] || [[ $f == *"$keyword"* ]] && echo "$f"; done))
                filtered_files=($(for f in "${filtered_files[@]}"; do echo "$f"; done | sort))
                if (( file_number >= 1 && file_number <= ${#filtered_files[@]} )); then
                    file_name=$(basename "${filtered_files[$((file_number - 1))]}")
                    remove_desktop_file "$file_name"
                else
                    echo "Invalid file number."
                fi
                ;;
            5)
                break
                ;;
            *)
                echo "Invalid choice. Please try again."
                ;;
        esac

        echo
    done
}

main
