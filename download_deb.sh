#!/bin/bash

cd $HOME/Downloads || exit
sudo dpkg -i $1*.deb
rm $1*.deb

