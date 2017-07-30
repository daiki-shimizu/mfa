if [ -d google-authenticator-libpam ]; then
  cd google-authenticator-libpam
  make uninstall
  cd ..
  rm -rf google-authenticator-libpam
fi
[ ! -f /usr/local/bin/google-authenticator ] && [ ! -f /usr/local/lib/security/pam_google_authenticator.so ]
