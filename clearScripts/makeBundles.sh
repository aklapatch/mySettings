#!/bin/bash

echo "Making xfce bundle 'xfce4-extras'"
sudo mixin package add xfce4-battery-plugin --bundle xfce4-extras
sudo mixin package add xfce4-pulseaudio --bundle xfce4-extras
sudo mixin package add xfce4-power-manager --bundle xfce4-extras

echo "Making kernel bundle 'linux-mod-bundle'"
sudo mixin package add linux-mod --bundle linux-mod-bundle

echo "Building mix"
sudo mixin build

echo "To migrate, do this: 'sudo swupd check-update'"                                     
echo "'sudo swupd update --migrate'"                                                                
echo "'sudo swupd check-update'" 
