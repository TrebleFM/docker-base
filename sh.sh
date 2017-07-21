#!/bin/dash

# Only call this if running on a Convox rack and EC2_HOSTNAME isn't already defined
if [ "$RACK" != "" ] && [ "$EC2_HOSTNAME" = "" ]; then
    # NOTE - This allows containers to easily communicate with agent services running on the same EC2 instance
    export EC2_HOSTNAME=$(curl -s http://169.254.169.254/latest/meta-data/local-hostname)
fi

# Load NVM
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Use dash for everything else
exec "/bin/dash" "$@"
