## Desktop Shortcut Manager

Welcome to the realm of the Desktop Shortcut Manager! This powerful command-line tool, crafted with Python sorcery, empowers you to masterfully control the mystical `.desktop` files dwelling within the sacred domain of `/usr/share/applications/`. With its enchanting capabilities, you can effortlessly list, edit, create, remove, and restore backups of these files, bestowing upon you the ability to sculpt your desktop shortcuts with unrivaled finesse.

### Prerequisites

But before you embark on this magical journey, ensure that you possess the necessary administrative privileges to access and manipulate the files in the illustrious realm of `/usr/share/applications/`. To unlock the full potential of the script, wield the mighty command of `sudo`, granting you the authority to commandeer the forces of change.

### Usage

1. **Download the Script:** Begin your journey by acquiring the mighty Python script, `shortcut-manager.py`, bestowed upon the digital realm either through a divine download or by cloning the sacred repository to your machine.

2. **Summon the Commanding Terminal:** Invoke the powers of the terminal, opening a gateway to the mystical lands of code. Traverse through the directories until you reach the sacred dwelling where the legendary `shortcut-manager.py` script rests.

3. **Ignite the Script's Magic:** Utter the incantation, executing the revered command that breathes life into the Desktop Shortcut Manager, awakening its powers and unveiling its mystical menu.

   ```bash
   sudo python shortcut-manager.py
   ```

4. **Menu Options:** Embark on a grand adventure as the script unfurls its majestic menu, offering you an array of enchanting options to wield your power over desktop shortcuts:

   - **1. List all shortcuts:** Gaze upon the mystical realm of `.desktop` files residing within the hallowed `/usr/share/applications/` directory. Unleash the power of keywords to unveil specific files that match your desires.

   - **2. Edit shortcut:** Peer into the realm of `.desktop` files and select a chosen one to modify at your will. Harness the might of keywords to swiftly locate your target within the vast expanse.

   - **3. Create a new shortcut:** Awaken the dormant energies of creation as you forge a brand-new `.desktop` file. Utter the desired name, and behold as the script breathes life into your creation.

   - **4. Remove shortcut:** Survey the realm of `.desktop` files and select a hapless victim to banish from existence. Wield the power of keywords to swiftly pinpoint your target and erase it from the digital tapestry.

   - **5. Restore a backup:** Traverse the ethereal realm of backups, where forgotten files slumber. Select a file from the realm, blessed with the ability to reverse time and restore its essence. Witness the birth of a new backup when a modified shortcut beckons.

   - **6. Exit** Bid adieu to the script, temporarily parting ways with its magical offerings, until the time comes to reunite and continue your mythical journey.

5. **Follow the Instructions:** Embark on an epic quest, guided by the script's ethereal instructions. 

6. **Review the Results:** Witness the aftermath of your actions unfold before your eyes. Behold the script's proclamation of triumph or the revelation of any errors that may have plagued your path.

### Notes

- **Backup & Restore:** Safeguard your shortcuts! Backups are created before editing, ensuring a retreat from irreversible changes. Restore backups from the menu, vanishing upon restoration.

- **File Permission Issues:** Embrace power! Employ `sudo` to conquer file permission woes and unleash administrative privileges upon the script.

- **Simple ReadMe version** It can be found at [simplified_README.md](simplified_README.md)