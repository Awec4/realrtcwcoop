#!/bin/bash
PAKFILE=sp_pak_coop1.pk3
BINFILE=bin.pk3

echo "Creating directories"

if [ "`uname`" = "Darwin" ]; then
        mkdir -p ~/Documents/realrtcwcoop/realcoopmain/
fi

if [ "`uname`" = "Linux" ]; then
        mkdir -p ~/.wolf/realcoopmain
fi

echo "Creating " $PAKFILE

cd media/sp_pak_coop1

zip -qur $PAKFILE ./ -x "*.svn*"

if [ "`uname`" = "Darwin" ]; then
        cp $PAKFILE ~/Documents/realrtcwcoop/realcoopmain/
fi

if [ "`uname`" = "Linux" ]; then
        cp $PAKFILE ~/.wolf/realcoopmain
fi

mv $PAKFILE ../

echo "Creating " $BINFILE

if [ "`uname`" = "Darwin" ]; then
        cd "../../build"
	for i in $(find . -type f -name "*.coop.*.dylib" ! -name "*qagame*"); do zip -qurj $BINFILE $i; done
        cp $BINFILE ~/Documents/realrtcwcoop/realcoopmain/
        mv $BINFILE ../media/
fi

if [ "`uname`" = "Linux" ]; then
        cd "../../build"
	for i in $(find . -type f -name "*.coop.*.so" ! -name "*qagame*"); do zip -qurj $BINFILE $i; done
        cp $BINFILE ~/.wolf/realcoopmain/
        mv $BINFILE ../media/
fi

echo "Done"
