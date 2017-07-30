MFA cookbook
=====================
This cookbook is designed to provide useful functions to implemet multi-factor authentication for SSH access to remote Linux by using Google Authenticator.


Installation functions
-------------
   - Install required packages for compiling the source code of Google Authenticator.
   - Compile the source code of Google Authenticator and install the software into the system.
   - Prepare an /etc/profile.d/google-authenticator.sh script for creating a secret file for specified users.
   - Update /etc/ssh/sshd/config to accept the authentication results with public keys and keyboard-interactive.
   - Update /etc/pam.d/sshd to accept the results of Google Authenticator.
   - Perform all the above steps at once.


Uninstallation functions
-------------
   - Uninstall installed packages that were used to compile the source code of Google Authenticator.
   - Uninstall the software from the system.
   - Delete the /etc/profile.d/google-authenticator.sh script.
   - Restore /etc/ssh/sshd/config from a backup copy.
   - Restore /etc/pam.d/sshd from a backup copy.
   - Perform all the above steps at once.
   - Perform all the above steps except for uninstallation of installed packages at once.
   - Delete generated secret files for specified users.


Requirements
----------------
This cookbook is tested in the following environment.

- RHEL7.2 on LinuxONE Community Cloud
- Chef Client 13.1.31
- Google Authenticator committed on May 19 in 2017.



Quick start
-------
First, create a JSON file to describe the names of users that should use multiple authentication for SSH access as below. The users should be authenticated with public keys when logging into Linux with SSH.


mfa.json
```json
{
  "mfa": {
    "user_names": "linux2"
  }
}
```


Second, execute chef-client with local mode as below. Specify the JSON file with -j option and the mfa installation recipe with -o option.


```
sudo chef-client -z -j mfa.json -o "mfa::install"
```


Finally, notify users to log into Linux with SSH. Users will get QR code or secret keys. After adding the code or secret key to users' favorite authentication applications supporting Google Authenticator, users will use one-time password authentication besides public key authentication.


Recipes
-------
### install_package
Install the follwoing packages required to compile the source code of Google Authenticator.

  - autoconf
  - automake
  - libtool
  - git
  - pam-devel


### install_google_authenticator
Download and compile the source code of Google Authenticator, and install the software into the system. The following files are created.

- /usr/local/bin/google-authenticator
- /usr/local/lib/security/pam_google_authenticator.so


### create_google_authenticator_profile
Create an /etc/profile.d/google-authenticator.sh script for creating a secret file automatically when specified users log in.


### update_sshd_config
Update /etc/ssh/sshd/config to accept the authentication results with public keys and keyboard-interactive after making and renaming a backup copy to /etc/ssh/sshd/config.backup.


### create_PAM_google_authenticator
Create /etc/pam.d/google-auth to authenticate users with keyboard-interactive.


### update_PAM_sshd
Update /etc/pam.d/sshd to accept the results of the above google-auth after making and renaming a backup copy to /etc/pam.d/sshd.backup.


### install
Perform the follwoing recipes at once.

   - install_packages
   - install_google_authenticator
   - create_google_authenticator_profile
   - update_sshd_config
   - create_PAM_google_authenticator
   - update_PAM_sshd


### uninstall_package
Uninstall packages that were used to compile the source code of Google Authenticator.


### uninstall_google_authenticator
Uninstall the Google Authentiator from the system. The following files are deleted.

- /usr/local/bin/google-authenticator
- /usr/local/lib/security/pam_google_authenticator.so


### delete_google_authenticator_profile
Delete the /etc/profile.d/google-authenticator.sh script.


### delete_google_authenticator_secret_key
Delete generated secret files for specified users. In case of linux2 user, /home/linux2/.google_authenticator is deleted.


### restore_sshd_config
Restore /etc/ssh/sshd/config from a backup copy /etc/ssh/sshd_config.backup.


### restore_PAM_sshd
Restore /etc/pam.d/sshd from a backup copy /etc/pam.d/sshd.backup.


### uninstall
Perform the follwoing recipes at once.

- restore_PAM_sshd
- delete_PAM_google_authenticator
- restore_sshd_config
- delete_google_authenticator_profile
- delete_google_authenticator_secret_key
- uninstall_google_authenticator
- uninstall_package


### cleanup
Clean up the environment. Different from the uninstall recipe, installed packages are not uninstalled to avoid unwanted side effects.


Authors
---------------------
Author:: Daiki Shimizu [dshimizu@jp.ibm.com](mailto:dshimizu@jp.ibm.com)
