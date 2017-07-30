if [ ! -d google-authenticator-libpam-master ]; then
  wget https://github.com/google/google-authenticator-libpam/archive/master.zip
  unzip master.zip
  rm -f master.zip
  cd google-authenticator-libpam-master
  ./bootstrap.sh
  ./configure
  make
  make install
fi

[ -f /usr/local/bin/google-authenticator ] && [ -f /usr/local/lib/security/pam_google_authenticator.so ]
