#!/bin/bash



# Tell if script is being run as superuser 

# Found on: https://stackoverflow.com/questions/18215973/how-to-check-if-running-as-root-in-a-bash-script
#
if [ "$EUID" -ne 0 ]; then 
        echo "Please run script as root " 
        exit
fi

# remove existing go files 
if [ -d /usr/local/go ]; then

        rm -rf /usr/local/go 
        echo -en "=======\nremoved older go versions\n=======\n"
        sleep 3
fi


# download golang binaries 
wget https://go.dev/dl/go1.22.2.linux-amd64.tar.gz -O /home/$SUDO_USER/go

# untar binaries and copy to /usr/local/
tar vxzf /home/$SUDO_USER/go -C /usr/local/


# Add go lang to path 

echo "export PATH=$PATH:/usr/local/go/bin" >> /home/$SUDO_USER/.bashrc
source ~/.bashrc

echo "updated path "



