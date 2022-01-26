#!/bin/bash

# Install R
apt install dirmngr gnupg apt-transport-https ca-certificates software-properties-common
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/'
apt update
apt install r-base

# Print version
R --version

# Compilimg packages
apt install build-essential 
su - \
-c "R -e \"install.packages('shiny', repos='https://cran.rstudio.com/')\""

# Install shiny server
apt install gdebi-core
wget https://download3.rstudio.org/ubuntu-14.04/x86_64/shiny-server-1.5.17.973-amd64.deb
sudo gdebi shiny-server-1.5.17.973-amd64.deb

# Start server
systemctl status shiny-server.service
cp -r test-app/ /srv/shiny-server/