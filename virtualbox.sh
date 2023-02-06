#!/bin/bash

echo "What are you using? (Nvidia / VirtualBox / If none of these press enter):"
read graphics

echo "install dependencies"

if [[ "$graphics" =~ ^[nN][vV][iI][dD][iI][aA]$ ]]; then
	echo "nvidia"
elif [[ "$graphics" =~ ^[vV][iI][rR][tT][uU][aA][lL][bB][oO][xX]$ ]]; then
    echo "virtualbox" 
fi

echo "none"
