#!/bin/bash

# this runs at Codespace creation - not part of pre-build

echo "$(date)    post-create start" >> ~/status

#curl -s "https://get.sdkman.io" | bash
#source "$HOME/.sdkman/bin/sdkman-init.sh"

source /usr/local/sdkman/bin/sdkman-init.sh
sdk install springboot

echo "$(date)    post-create stop" >> ~/status