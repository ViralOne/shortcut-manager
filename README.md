## Desktop Shortcut Manager

The Desktop Shortcut Manager is a command-line tool written in Python that helps you manage `.desktop` files in the `/usr/share/applications/` directory. With this tool, you can easily list, edit, create, and remove `.desktop` files to customize your desktop shortcuts.

### Prerequisites

Before using the Desktop Shortcut Manager, make sure you have administrative privileges to access and modify files in the `/usr/share/applications/` directory. To run the script with administrative privileges, use `sudo`.

### Usage

1. **Download the Script:** Start by downloading the Python script, `shortcut-manager.py`, to your local machine.

2. **Open a Terminal:** Open a terminal and navigate to the directory where the `shortcut-manager.py` script is located.

3. **Run the Script:** Execute the following command to start using the Desktop Shortcut Manager:

   ```bash
   sudo python shortcut-manager.py
   ```

4. **Menu Options:** The script will present you with a menu that includes the following options:

   - **1. List .desktop files:** Displays a list of all `.desktop` files in the `/usr/share/applications/` directory. You can filter the files by entering a keyword.

   - **2. Edit a .desktop file:** Lists `.desktop` files and allows you to select a file to edit. You can also filter the files by entering a keyword.

   - **3. Create a new .desktop file:** Creates a new `.desktop` file. You will be prompted to enter the file name, and the script will create the file with the provided name.

   - **4. Remove a .desktop file:** Lists `.desktop` files and lets you choose a file to remove. You can filter the files by entering a keyword.

   - **5. Exit:** Exits the script.

5. **Follow the Instructions:** Follow the on-screen instructions and enter the appropriate options or values based on your desired action.

6. **Review the Results:** After completing an operation, the script will display the result or any error messages.

### Notes

- **Backup Important Files:** Before editing or removing any files, make sure to back up important files, as the changes made by the script are irreversible.

- **File Permission Issues:** If you encounter any issues or errors related to file permissions, ensure that you run the script with administrative privileges (e.g., using `sudo`).
