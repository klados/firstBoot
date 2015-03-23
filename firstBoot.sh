#!/bin/bash

#Created by George Klados 5/10/14 kladgeo@gmail.com
#FirstBoot is a script to install some usefull programmes on your pc

OS=$(lsb_release -si)                    #capture the user distro

    if [  $OS = "Fedora" ]; then
        pm="yum"                          #fedora package manager
    elif [ $OS = "Ubuntu" ]; then
<<<<<<< HEAD
    	pm="apt-get"                      #ubuntu package manager
<<<<<<< HEAD
=======
    	pm="apt-get"                      #ubuntu package manager           
>>>>>>> 5d60ec527ed211cb915a472c1fa418f8229136b6
    elif [ $OS = "Debian" ]; then         #debian
        pm="apt-get"
    else
      echo "Give the package manager name of your distro"
      read  pm     #read the name of your package manager
<<<<<<< HEAD
=======
    else
      read "Give the package manager name of your distro" pm     #read the name of your package manager
>>>>>>> ade989650c12732a29727c7ace86cf798bf086b8
=======
>>>>>>> 5d60ec527ed211cb915a472c1fa418f8229136b6
    fi

sudo -S $pm install dialog -y 		#install the gui library

DIALOG=${DIALOG=dialog}     #create the terminal gui

tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$    #create a temp file
trap "rm -f $tempfile" 0 1 2 5 15                          #delete the temp file at the exit


$DIALOG --clear --title "Select the programmes that you wish to install" \
        --checklist "Press space to select a programme" 200 100 15 \
        "nano"             "terminal text editor" off \
        "gcc"              "c compiler" off \
        "git"              "Share your code" off \
        "gcc-c++"          "g++ compiler" off \
        "gnome-tweak-tool" "usefull programme for gnome" off \
        "filezilla"        "transfer files via ssh" off \
        "guake"            "drop down terminal" off \
        "blender"          "3D modeling" off \
        "eclipse"          "java c\c++ IDE" off \
        "spyder"           "python IDE" off \
        "bluefish"         "php editor" off \
        "codeblocks"       "c\c++, Fortran IDE" off \
        "mypaint"	   "graphics application" off \
        "octave"           "like matlab" off \
        "maketext"          "LaTex" off \
        "thunderbird"      "email check" off \
        "xbindkeys"        "Remapping mouse/keyboard buttons" off \
        "wine"             "run windows applications" off 2> $tempfile

retval=$?

clear

choice=`cat $tempfile`                   #store the file to the variable, 1 line


<<<<<<< HEAD
case $retval in
<<<<<<< HEAD
0)										 #if the user choose something from the list
=======
0)					 #if the user choose something from the list
>>>>>>> ade989650c12732a29727c7ace86cf798bf086b8
=======
case $retval in 
0)					 #if the user choose something from the list	
>>>>>>> 5d60ec527ed211cb915a472c1fa418f8229136b6
    sudo -S $pm install $choice  -y      #install the i element

    sudo -S $pm update  -y               #update the system
;;
<<<<<<< HEAD
<<<<<<< HEAD
1)										 #press cancel
=======
1)					#press cancel
>>>>>>> ade989650c12732a29727c7ace86cf798bf086b8
=======
1)					 #press cancel						
>>>>>>> 5d60ec527ed211cb915a472c1fa418f8229136b6
	echo "Nothing installed, Goodbye";;
255)
    echo "ESC pressed.";;
esac

#end of  script
