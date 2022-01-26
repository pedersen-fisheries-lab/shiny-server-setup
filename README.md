## Setup

1. Clone this repository

```
git clone https://github.com/pedersen-fisheries-lab/shiny-server-setup.git
```

2. Run the setup script, and copy the test app to the serving folder

```
sudo ./shiny-server-setup/shiny_server_setup.sh
cp -r ~/shiny-server-setup/test-app/ /srv/shiny-server/
```

3. Edit `/etc/shiny-server/shiny-server.conf` to change the listening port to 80 (HTTP) 

4. Set up rules on Arbutus to let your IP throught the port. 

5. Remember your shiny app may have additionnal package and or/system requirements. For packages, use `renv` (restore then isolate). For system, make a custom script.

## Some useful system dependencies

```
# GDAL
sudo apt-get install libgdal-dev

# Udunits
sudo apt-get install libudunits2-dev
```