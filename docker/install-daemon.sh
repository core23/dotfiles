#!/bin/bash

sudo cp -f de.core23.socat_launcher.plist /Library/LaunchDaemons

cd /Library/LaunchDaemons/
sudo chown root:wheel de.core23.socat_launcher.plist
sudo launchctl load de.core23.socat_launcher.plist

echo "Docker TCP daemon installed"
