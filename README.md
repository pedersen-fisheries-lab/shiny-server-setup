## Setup the VM on the Arbutus cloud

server address example: http://206.12.100.5/DFO_SDM_Shiny_final/

The main resource for this setup is the [cloud quickstart guide](https://docs.alliancecan.ca/wiki/Cloud_Quick_Start). The interface is Arbutus's [openstack](https://arbutus.cloud.computecanada.ca/).

1. **Setup the ssh keys**: first, generate a key pair. The process is different for (Windows)[https://docs.alliancecan.ca/wiki/Generating_SSH_keys_in_Windows/en] and [Linux](https://docs.alliancecan.ca/wiki/Using_SSH_keys_in_Linux). Then, in openstack, import the key pair by navigating to the key pair tab on the left and following the guide's instructions. For the record, the key is currently named `arbutus_pedersen_key`, is stored [here](https://drive.google.com/file/d/154plUKqQ6PzAbSrD3wPQ_vkCSIWDbvD0/view?usp=sharing) with its passphrase (requires drive access). Only onw key pair per VM is allowed.

2. **Launch the VM**: follow the quickstart guide instructions (the currently running VM is named `shiny_server`). Choose the `shinyboot` booting volume (it's Ubuntu Focal), and the `p8-16gb` flavor (for maximum use of the resources available). Load the `def-pedersen-prod-network` and the `IPv6` networks onto the VM. If no booting volume is available, make sure that when you create one (see guide instructions) you only use half (max) of the maximum storage available so you can use the other half for creating a backup of the volume (to check what is your usgae limit, navigate the side bar to Compute -> Overview)

3. Associate the available floating IP to the new VM (navigate to Network -> Floating IPs). If you need to create one, refer once again to the guide to do so.

4. Connect with address `user-name@the-floating-ip>`, currently it is `ubuntu@` 

*A note on network settings*: the guide has all the instructions necessary for setting up the network. A very key element is to make sure to set up the security rules for the IP of any computer from which you will want to ssh to the VM.

## Setup the shiny server

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
