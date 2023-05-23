import os
import sys
import shutil

DESKTOP_DIR = "/usr/share/applications/"
BACKUP_DIR = "/usr/share/applications/backup/"

def list_desktop_files(keyword=None):
    print("Available .desktop files:")
    desktop_files = [f for f in os.listdir(DESKTOP_DIR) if f.endswith(".desktop")]
    desktop_files.sort()
    filtered_files = []
    for i, file in enumerate(desktop_files):
        if not keyword or keyword.lower() in file.lower():
            filtered_files.append(file)
            print(f"{len(filtered_files)}. {file}")
    if not filtered_files:
        print("No matching files found.")
    print()

def edit_desktop_file(file_name):
    file_path = os.path.join(DESKTOP_DIR, file_name)
    if not os.path.exists(file_path):
        print(f"File {file_name} does not exist.")
        return
    backup_path = os.path.join(BACKUP_DIR, file_name)
    if not os.path.exists(BACKUP_DIR):
        os.makedirs(BACKUP_DIR)
    shutil.copy2(file_path, backup_path)
    print(f"Backup created: {backup_path}")
    print(f"Editing file: {file_name}")
    print("Enter new values (leave blank to keep current value):")
    with open(file_path, "r") as f:
        lines = f.readlines()
    edited_lines = []
    for line in lines:
        if "=" in line:
            key, value = line.strip().split("=", 1)
            new_value = input(f"{key} [{value}]: ").strip()
            if new_value:
                line = f"{key}={new_value}\n"
        edited_lines.append(line)
    try:
        with open(file_path, "w") as f:
            f.writelines(edited_lines)
        print("File edited successfully.")
    except PermissionError:
        print("Permission denied. Please run the script with administrative privileges (e.g., using sudo).")

def restore_backup(file_name):
    backup_path = os.path.join(BACKUP_DIR, file_name)
    file_path = os.path.join(DESKTOP_DIR, file_name)
    if not os.path.exists(backup_path):
        print("Backup file does not exist.")
        return
    try:
        shutil.copy2(backup_path, file_path)
        print("Backup restored successfully.")
		os.remove(backup_path)
    except PermissionError:
        print("Permission denied. Please run the script with administrative privileges (e.g., using sudo).")

def create_desktop_file():
    print("Creating a new .desktop file:")
    template = """DESKTOP_FILE=[Desktop Entry]
Name=
Comment=
Exec=$APP_DIR %U
Icon=
Terminal=false
Type=Application
Encoding=UTF-8
Categories=;
Name[en_US]="""
    file_name = input("Enter the file name (without extension): ").strip() + ".desktop"
    file_path = os.path.join(DESKTOP_DIR, file_name)
    if os.path.exists(file_path):
        print("File already exists.")
        return
    try:
        with open(file_path, "w") as f:
            f.write(template)
        print(f"File {file_name} created successfully.")
        choice = input("Do you want to edit the file now? (y/n): ")
        if choice.lower() == "y":
            edit_desktop_file(file_name)
    except PermissionError:
        print("Permission denied. Please run the script with administrative privileges (e.g., using sudo).")

def remove_desktop_file(file_name):
    file_path = os.path.join(DESKTOP_DIR, file_name)
    if not os.path.exists(file_path):
        print(f"File {file_name} does not exist.")
        return
    try:
        os.remove(file_path)
        print(f"File {file_name} removed successfully.")
    except PermissionError:
        print("Permission denied. Please run the script with administrative privileges (e.g., using sudo).")

def main():
    if not os.geteuid() == 0:
        print("Please run the script with administrative privileges (e.g., using sudo).")
        sys.exit(1)

    while True:
        print("Options:")
        print("1. List all shortcuts")
        print("2. Edit shortcut")
        print("3. Create a new shortcut")
        print("4. Remove shortcut")
        print("5. Restore a backup")
        print("6. Exit")
        choice = input("Enter your choice (1-6): ")
        if choice == "1":
            os.system('clear')
            keyword = input("Enter a keyword to filter files (leave blank for all files): ")
            list_desktop_files(keyword)
        elif choice == "2":
            os.system('clear')
            keyword = input("Enter a keyword to filter files (leave blank for all files): ")
            list_desktop_files(keyword)
            file_number = int(input("Enter the file number to edit: "))
            filtered_files = [f for f in os.listdir(DESKTOP_DIR) if f.endswith(".desktop")]
            filtered_files = [f for f in filtered_files if not keyword or keyword.lower() in f.lower()]
            filtered_files.sort()
            if 1 <= file_number <= len(filtered_files):
                file_name = filtered_files[file_number - 1]
                edit_desktop_file(file_name)
            else:
                print("Invalid file number.")
        elif choice == "3":
            os.system('clear')
            create_desktop_file()
        elif choice == "4":
            os.system('clear')
            keyword = input("Enter a keyword to filter files (leave blank for all files): ")
            list_desktop_files(keyword)
            file_number = int(input("Enter the file number to remove: "))
            filtered_files = [f for f in os.listdir(DESKTOP_DIR) if f.endswith(".desktop")]
            filtered_files = [f for f in filtered_files if not keyword or keyword.lower() in f.lower()]
            filtered_files.sort()
            if 1 <= file_number <= len(filtered_files):
                file_name = filtered_files[file_number - 1]
                remove_desktop_file(file_name)
            else:
                print("Invalid file number.")
        elif choice == "5":
            os.system('clear')
            keyword = input("Enter a keyword to filter files (leave blank for all files): ")
            list_desktop_files(keyword)
            file_number = int(input("Enter the file number to restore from backup: "))
            filtered_files = [f for f in os.listdir(BACKUP_DIR) if f.endswith(".desktop")]
            filtered_files = [f for f in filtered_files if not keyword or keyword.lower() in f.lower()]
            filtered_files.sort()
            if 1 <= file_number <= len(filtered_files):
                file_name = filtered_files[file_number - 1]
                restore_backup(file_name)
            else:
                print("Invalid file number.")
        elif choice == "6":
            break
        else:
            print("Invalid choice. Please try again.")

if __name__ == "__main__":
    main()
