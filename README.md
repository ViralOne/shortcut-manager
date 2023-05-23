## Desktop Shortcut Manager

The Desktop Shortcut Manager is a command-line tool written in Bash for managing `.desktop` files in the `/usr/share/applications/` directory. It provides options to list, edit, create, and remove `.desktop` files.

### Prerequisites

- This tool requires administrative privileges to access and modify files in the `/usr/share/applications/` directory. Make sure to run the script with administrative privileges (e.g., using `sudo`).

### Usage

1. Download the `shortcut-helper.sh` script to your local machine.

2. Open a terminal and navigate to the directory where the `shortcut-helper.sh` script is located.

3. Run the following command to make the script executable:

   ```bash
   chmod +x shortcut-helper.sh
   ```

4. To start using the Desktop Shortcut Manager, run the script using the following command:

   ```bash
   ./shortcut-helper.sh
   ```

5. The script will display a menu with the following options:

   - **1. List .desktop files:** List all `.desktop` files in the `/usr/share/applications/` directory. You can filter the files by entering a keyword.

   - **2. Edit a .desktop file:** List `.desktop` files and select a file to edit. You can filter the files by entering a keyword.

   - **3. Create a new .desktop file:** Create a new `.desktop` file. You will be prompted to enter the file name and can choose to edit it immediately.

   - **4. Remove a .desktop file:** List `.desktop` files and select a file to remove. You can filter the files by entering a keyword.

   - **5. Exit:** Exit the script.

6. Follow the on-screen instructions and enter the appropriate options or values based on your desired action.

7. After completing an operation, the script will display the result or any error messages.

### Examples

#### List .desktop files

To list all `.desktop` files, choose option `1` from the menu. You can also enter a keyword to filter the files based on the file name.

#### Edit a .desktop file

To edit a specific `.desktop` file, choose option `2` from the menu. The script will display the list of `.desktop` files, and you can enter the corresponding file number to edit. You can also enter a keyword to filter the files.

#### Create a new .desktop file

To create a new `.desktop` file, choose option `3` from the menu. You will be prompted to enter the file name (without the extension). The script will create the file with the provided name and open it for editing.

#### Remove a .desktop file

To remove a specific `.desktop` file, choose option `4` from the menu. The script will display the list of `.desktop` files, and you can enter the corresponding file number to remove. You can also enter a keyword to filter the files.

### Bugs

- The search it's case sensitive
- When trying to edit a file, it will open a different one

### Notes

- Make sure to back up important files before editing or removing them, as the changes are irreversible.

- If you encounter any issues or errors related to file permissions, try running the script with administrative privileges (e.g., using `sudo`).
