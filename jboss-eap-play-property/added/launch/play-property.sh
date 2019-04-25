#!/bin/sh
# Run the CLI script in the embedded server

# This gets called by configure.sh which passes in a 'phase' each time it calls it:
#   - preConfigure - Here the script does not work at all
#   - configure - Here the script works
#   - postConfigure - Here the script works too
#
# We only want to run it once, so for now choose 'configure'. We are the last module in 'configure' so for this POC 
# we are probably safe. However, Ken mentions that 'postConfigure' might be safer. 

# Params passed in by the script
# This will be the name of this script (/opt/eap/bin/launch/play-property.sh). We don't need it, this is just for self documetation
launchModule=$1 
# The phase
configurePhase=$2

if [ "$configurePhase" = "configure" ] ; then
    echo "Starting jboss-cli Configuration..."
    echo "$JBOSS_HOME/bin/jboss-cli.sh --file=$JBOSS_HOME/bin/launch/play-property.cli"
    "$JBOSS_HOME/bin/jboss-cli.sh" --file="$JBOSS_HOME/bin/launch/play-property.cli"
    echo "jboss-cli configuration done!"
fi