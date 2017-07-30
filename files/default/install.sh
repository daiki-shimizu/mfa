if [ ! -d google-authenticator-libpam ]; then
  git clone https://github.com/google/google-authenticator-libpam.git
  cd google-authenticator-libpam
  ./bootstrap.sh
  ./configure
  make
  make install
fi

[ -f /usr/local/bin/google-authenticator ] && [ -f /usr/local/lib/security/pam_google_authenticator.so ]
