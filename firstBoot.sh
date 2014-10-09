#!/bin/bash

#Created by George Klados 5/10/14 kladgeo@gmail.com
#FirstBoot is a script to install some usefull programmes on your pc

OS=$(lsb_release -si)                    #capture the user distro

    if [  $OS = "Fedora" ]; then
        pm="yum"                          #fedora package manager
    elif [ $OS = "Ubuntu" ]; then
        pm="apt-get"                      #ubuntu package manager           
    else 
      read "Give the package manager name of your distro" pm     #read the name of your package manager
    fi

sudo -S $pm install dialog -y #install the gui library

DIALOG=${DIALOG=dialog}     #create the terminal gui

tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$    #create a temp file
trap "rm -f $tempfile" 0 1 2 5 15                          #delete the temp file at the exit


$DIALOG --clear --title "Select the programmes that you wish to install" \
        --checklist "Press space to select a programme" 200 100 15 \
        "nano"             "terminal text editor" off \
        "gcc"              "c compiler" off \
        "gcc-c++"              "g++ compiler" off \
        "gnome-tweak-tool" "usefull programme for gnome" off \
        "filezilla"        "transfer files via ssh" off \
        "guake"            "drop down terminal" off \
        "blender"          "3D modeling" off \
        "eclipse"          "java c\c++ IDE" off \
        "spyder"           "python IDE" off \
        "bluefish"         "php editor" off \
        "codeblocks"       "c\c++, Fortran IDE" off \
        "octave"           "like matlab" off \
<<<<<<< HEAD
        "texmaker"         "LaTex" off\
=======
>>>>>>> 00976223f1081e0d00aaf8f110fe29eed502a3ad
        "thunderbird"      "email check" off \
        "wine"             "run windows applications" off 2> $tempfile

retval=$?

clear

choice=`cat $tempfile`                   #store the file to the variable, 1 line 


case $retval in 
<<<<<<< HEAD
0)                                       #if the user choose something from the list    
=======
0)					 #if the user choose something from the list	
>>>>>>> 00976223f1081e0d00aaf8f110fe29eed502a3ad
    sudo -S $pm install $choice  -y      #install the i element

    sudo -S yum update  -y               #update the system
;;
<<<<<<< HEAD
1)                                       #press cancel                      
    echo "Nothing installed, Goodbye";;
=======
1)					 #press cancel						
	echo "Nothing installed, Goodbye";;
>>>>>>> 00976223f1081e0d00aaf8f110fe29eed502a3ad
255)
    echo "ESC pressed.";;
esac

#end of  script
