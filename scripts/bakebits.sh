#!/bin/bash


#BITBAKE_COMMAND="core-image-minimal" 
BITBAKE_COMMAND="bitbake core-image-wavin-ics"
#Find all process containing "bitbake"
pids=$(ps aux | grep '[b]itbake' | awk '{print $2}')
#pids=$(pgrep -f bitbake)

# Check if the PIDS are still active
if [ -z "$pids" ]; then
  echo "No active bitbake-processes found"
else
  echo "Closing bitbake-processen..."

  
  for pid in $pids; do
    if [[ -e /proc/$pid/cmdline ]]; then
      cmdline=$(tr '\0' ' ' < /proc/$pid/cmdline 2>/dev/null)

      # Check if commandline really contains 'bitbake'
      if [[ "$cmdline" == *"bitbake"* ]]; then
        echo "Proces $pid found: $cmdline"

        # Close pid without interrupting the script
        { kill "$pid" && wait "$pid"; } 2>/dev/null
        echo "Bitbake proces PID $pid is closed."
      else
        echo "PID $pid is not a BitBake-proces, skipped."
      fi
    else
      echo "PID $pid no longer exists, skipped."
    fi
  done
  echo "All bitbake-processen are closed."
fi

# Start het BitBake-commando in subshell
(
  echo "Starting bitbake: $BITBAKE_COMMAND"
  echo $(pwd)
  cd ..
  PRODUCT=wesl VERSION=main source setup-environment build
  cd ..
  echo $(pwd)
  source sources/oe-init-build-env build
  #source sources/oe-init-build-env build
  #cd build
  ( eval "$BITBAKE_COMMAND" ) 

  # Controleer of het commando correct is gestart
  if [ $? -eq 0 ]; then
    echo "Bitbake-command succesfull started."
  else
    echo "Error starting BitBake-command."
  fi
)