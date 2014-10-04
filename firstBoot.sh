#!/bin/bash  

#Created by George Klados 4/10/14 kladgeo@gmail.com
#FirstBoot is a script to install some usefull programmes on your pc

declare -a TABLE=(	  #TABLE is an array, contain all the programmes for install
					'nano'                       #terminal text editor  
          'gcc'                        #compiler c      
          'gcc-c++'                    #compiler c++
          'gnome-tweak-tool'           #usefull programme for gnome
          'filezilla'                  #transfer files via ssh
          'guake'                      #drop down terminal
					'blender'                    #3D modeling
					'eclipse'                    #java c\c++ IDE    
					'spyder'                     #python IDE
          'octave'                     #like matlab
          'wine'                       #run windows applications
					);
 
clear                                    #clear the terminal

OS=$(lsb_release -si)                    # the user distro

    if [  $OS = "Fedora" ]; then
       echo "-->fedora"
       pm="yum"                          #fedora package manager
    elif [ $OS = "Ubuntu" ]; then
    	echo "-->ubuntu"
    	pm="apt-get"                       #ubuntu package manager           
    else 
      echo "Give the package manager name of your distro"
      read pm                             #read the name of your package manager
    fi
    
#install the programmes of the array

    for I in ${TABLE[@]} 
    do                                   #for all the elements of the array
       	sudo -S $pm install $I  -y       #install the i element
    done 

    sudo -S yum update                   #update the system

echo "---end of script---"