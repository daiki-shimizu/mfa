if [ -d google-authenticator-libpam-master ]; then
  cd google-authenticator-libpam-master
  make uninstall
  cd ..
  rm -rf google-authenticator-libpam-master
fi
[ ! -f /usr/local/bin/google-authenticator ] && [ ! -f /usr/local/lib/security/pam_google_authenticator.so ]
