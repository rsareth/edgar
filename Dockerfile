FROM    ubuntu:14.04
RUN     apt-get --quiet --yes update && apt-get --yes upgrade
RUN     apt-get --yes install git curl vim
# Some gem need specific package within the OS.
RUN     apt-get --yes install redis-server qt5-default libqt5webkit5-dev libpq-dev

# Installing RVM for RUBY-2.0.0
RUN     gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
RUN     curl -sSL https://get.rvm.io | bash -s stable
RUN     echo 'source /etc/profile.d/rvm.sh' >> ~/.bashrc
RUN     echo 'source /etc/profile.d/rvm.sh' >> ~/.bash_profile
RUN     echo "gem: --no-rdoc --no-ri" >> ~/.gemrc
RUN     /bin/bash -l -c "rvm requirements"
RUN     /bin/bash -l -c "rvm autolibs enable"
RUN     /bin/bash -l -c "rvm install 2.0.0-p598"
RUN     /bin/bash -l -c "gem install bundle"

# Create a specific user for Merci Edgar
RUN     useradd rails -m --home-dir /var/rails
USER    rails
RUN     echo 'source /etc/profile.d/rvm.sh' >> ~/.bashrc
RUN     echo 'source /etc/profile.d/rvm.sh' >> ~/.bash_profile
RUN     echo "gem: --no-rdoc --no-ri" >> ~/.gemrc

# Cloning the latest version of Merci Edgar
RUN     git clone https://github.com/rsareth/edgar.git /var/rails/edgar
WORKDIR /var/rails/edgar

# Dependencies for Merci Edgar
USER    root
RUN     /bin/bash -l -c "bundle install"

# Auto run the rails app
EXPOSE  3000
ENV     RAILS_ENV development_docker
CMD     ["/var/rails/edgar/script/edgar-entrypoint.sh"]
