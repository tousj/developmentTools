
#Install (from http://docs.docker.com/linux/step_one/)
wget -qO- https://get.docker.com/ | sh
#Add permission
sudo usermod -aG docker tousj
#logout and login to update permissions

#Build the embeded development environment image
docker build -t sqdr:EmbeddedDev .

#Put the dockerLaunch.sh script somewhere in your path
cp dockerLaunch.sh /usr/local/bin #or somewhere else

#Change directory to your embeded workspace
cd ~/embedded
ls .
MAVProxy  PX4Firmware  PX4NuttX  VRNuttX  autopilot 

#Run and enter your environment interactivly
dockerLaunch.sh .

#Do your stuff
cd autopilot
./Launchbuild #for example
...

#logout
exit

