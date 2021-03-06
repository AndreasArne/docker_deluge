#!/bin/sh

set -e

rm -f /config/deluged.pid

# Read settings (umask)
#/bin/bash -c "source root/.profile"

# Run as not daemon because "docker run.." shutsdown otherwise
#deluged -c /config -L warning -l /config/deluged.log

# start deluged and deluge-web
sudo invoke-rc.d deluge-daemon start


# Start webui
#deluge-web

