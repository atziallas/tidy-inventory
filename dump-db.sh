#!/bin/bash

# Get current date in dd-MM-yyyy format
current_date=$(date '+%d-%m-%Y')

# Get the latest annotated git tag
version=$(git describe --abbrev=0 --tags)

filename="${current_date}-${version}"

# Build the command - wrap with sh -c and quote the entire thing for kamal
cmd="sh -c \"pg_dump -Fc -U tidy tidy > /home/backups/${filename}.dump\""
echo "Running command into db container: $cmd"

# Pass it to kamal
dotenvx run -- kamal accessory exec db --reuse -- "$cmd"

# Copy the dump file from remote to local
echo "Copying dump file from remote host..."
scp tziallas:/home/tidy-inventory-db/backups/${filename}.dump ./db/backups/

