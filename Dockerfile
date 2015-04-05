FROM    ubuntu:14.04
RUN     apt-get --quiet --yes update && apt-get --yes upgrade
RUN     apt-get --yes install git curl vim
RUN     apt-get --yes install redis-server qt5-default libqt5webkit5-dev libpq-dev


# Create a specific user for Merci Edgar
RUN     useradd rails -m --home-dir /var/rails
USER    rails

# Cloning the latest version of Merci Edgar
RUN     git clone https://github.com/rsareth/edgar.git /var/rails/edgar
WORKDIR /var/rails/edgar

# Installing RVM for RUBY-2.0.0
RUN     gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
RUN     curl -sSL https://get.rvm.io | bash -s stable
RUN     echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"' >> ~/.bashrc
RUN     echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"' >> ~/.bash_profile
RUN     echo "gem: --no-rdoc --no-ri" >> ~/.gemrc
RUN     /bin/bash -l -c "rvm requirements"
RUN     /bin/bash -l -c "rvm autolibs enable"
RUN     /bin/bash -l -c "rvm install 2.0.0-p643"
RUN     /bin/bash -l -c "ruby --version"
RUN     /bin/bash -l -c "gem install bundle"

# Dependencies for Merci Edgar
# Some gem need specific package within the OS.
RUN     /bin/bash -l -c "bundle install"
