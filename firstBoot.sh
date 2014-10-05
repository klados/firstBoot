#!/bin/bash

#install dialog
#install xdialog ,window 

OS=$(lsb_release -si)                    #capture the user distro

    if [  $OS = "Fedora" ]; then
        pm="yum"                          #fedora package manager
    elif [ $OS = "Ubuntu" ]; then
    	pm="apt-get"                      #ubuntu package manager           
    else 
      read "Give the package manager name of your distro" pm     #read the name of your package manager
    fi

sudo -S $pm install dialog  #install the gui library

DIALOG=${DIALOG=dialog}     #create the terminal gui

tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$    #create a temp file
trap "rm -f $tempfile" 0 1 2 5 15                          #delete the temp file at the exit


$DIALOG --clear --title "Select the programmes that you wish to install" \
        --checklist "Press space to select a programme" 200 100 15 \
        "nano"             "terminal text editor" off \
        "gcc"              "c compiler" off \
        "g++"              "g++ compiler" off \
        "gnome-tweak-tool" "usefull programme for gnome" off \
        "filezilla"        "transfer files via ssh" off \
        "guake"            "drop down terminal" off \
        "blender"          "3D modeling" off \
        "eclipse"          "java c\c++ IDE" off \
        "spyder"           "python IDE" off \
        "octave"           "like matlab" off \
        "wine"             "run windows applications" off 2> $tempfile

retval=$?


choice=`cat $tempfile`                   #store the file to the variable 


case $retval in 
0)										 #if the user choose something from the list	
	for I in $choice
    do                                   #for all the elements of the array
       	sudo -S $pm install $I  -y       #install the i element
    done 

    sudo -S yum update  -y               #update the system
;;
1)										 #press cancel						
	echo "Nothing installed, Goodbye";;
255)
    echo "ESC pressed.";;
esac

#end of the script