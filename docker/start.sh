#!/bin/sh

set -e

rm -f /config/deluged.pid

# Read settings (umask)
/bin/bash -c "source root/.profile"

# Run as not daemon because "docker run.." shutsdown otherwise
deluged -d -c /config -L warning -l /config/deluged.log
