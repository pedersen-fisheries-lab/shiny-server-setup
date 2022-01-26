#!/bin/bash

# Install R
echo 'Installing R'
apt install dirmngr gnupg apt-transport-https ca-certificates software-properties-common
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/'
apt update
apt install r-base
echo 'R installed'

# Print version
echo 'Testing R version'
R --version

# Compilimg packages
echo 'Installing shiny package'
apt install build-essential 
su - \
-c "R -e \"install.packages('shiny', repos='https://cran.rstudio.com/')\""
echo 'Shiny package installed'

# Install shiny server
echo 'Installing shiny server'
apt install gdebi-core
wget https://download3.rstudio.org/ubuntu-14.04/x86_64/shiny-server-1.5.17.973-amd64.deb
sudo gdebi shiny-server-1.5.17.973-amd64.deb
echo 'Shiny server installed'

# Start server
echo 'Starting shiny server'
systemctl status shiny-server.service
cp -r ~/shiny-server-setup/test-app/ /srv/shiny-server/
echo 'Setup done'