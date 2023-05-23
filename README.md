## Desktop Shortcut Manager

The Desktop Shortcut Manager is a command-line tool written in Python for managing `.desktop` files in the `/usr/share/applications/` directory. It provides options to list, edit, create, and remove `.desktop` files.

### Prerequisites

- This tool requires administrative privileges to access and modify files in the `/usr/share/applications/` directory. Make sure to run the script with administrative privileges (e.g., using `sudo`).

### Usage

1. Download the Python script, `shortcut-manager.py`, to your local machine.

2. Open a terminal and navigate to the directory where the `shortcut-manager.py` script is located.

3. Run the following command to start using the Desktop Shortcut Manager:

   ```bash
   python shortcut-manager.py
   ```

4. The script will display a menu with the following options:

   - **1. List .desktop files:** List all `.desktop` files in the `/usr/share/applications/` directory. You can filter the files by entering a keyword.

   - **2. Edit a .desktop file:** List `.desktop` files and select a file to edit. You can filter the files by entering a keyword.

   - **3. Create a new .desktop file:** Create a new `.desktop` file. You will be prompted to enter the file name, and the script will create the file with the provided name.

   - **4. Remove a .desktop file:** List `.desktop` files and select a file to remove. You can filter the files by entering a keyword.

   - **5. Exit:** Exit the script.

5. Follow the on-screen instructions and enter the appropriate options or values based on your desired action.

6. After completing an operation, the script will display the result or any error messages.

### Examples

#### List files

To list all `.desktop` files, choose option `1` from the menu. You can also enter a keyword to filter the files based on the file name.

#### Edit file

To edit a specific `.desktop` file, choose option `2` from the menu. The script will display the list of `.desktop` files, and you can enter the corresponding file number to edit. You can also enter a keyword to filter the files.

#### Create a new file

To create a new `.desktop` file, choose option `3` from the menu. You will be prompted to enter the file name (without the extension). The script will create the file with the provided name.

#### Remove file

To remove a specific `.desktop` file, choose option `4` from the menu. The script will display the list of `.desktop` files, and you can enter the corresponding file number to remove. You can also enter a keyword to filter the files.

### Notes

- Make sure to back up important files before editing or removing them, as the changes are irreversible.

- If you encounter any issues or errors related to file permissions, make sure to run the script with administrative privileges (e.g., using `sudo`).
