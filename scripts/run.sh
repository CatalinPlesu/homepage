#!/bin/bash

# Check if interactive argument is provided
if [[ "$1" == "interactive" || "$1" == "-i" ]]; then
    INTERACTIVE=true
else
    INTERACTIVE=false
fi

# Read .env file line by line and build the -e arguments
env_args=""
while read -r line || [[ -n "$line" ]]; do
  # Skip comments and empty lines
  if [[ "$line" =~ ^#.* ]] || [[ -z "$line" ]]; then
    continue
  fi
  
  # Remove the 'export ' keyword if it exists at the start of the line
  clean_line="${line#export }"
  
  # Add the -e flag for each cleaned KEY=VALUE pair
  env_args+=" -e $clean_line"
done < .env

# Build the podman command based on mode
if [[ "$INTERACTIVE" == true ]]; then
    # Interactive mode
    podman run -it \
        $env_args \
        -v /etc/homepage/:/etc/homepage/ \
        --user $(id -u):$(id -g) \
        homepage:latest \
        /bin/bash
else
    # Normal mode (original behavior)
    podman run \
        $env_args \
        -v /etc/homepage/:/etc/homepage/ \
        -p 127.0.0.1:8000:80 \
        --user $(id -u):$(id -g) \
        homepage:latest
fi
