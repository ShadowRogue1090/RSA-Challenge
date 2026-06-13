#!/bin/bash

## Input: Alice's private key (private-key, provide filepath) and Bob's public key (BOBKEY123)
## Output: 75e2f89beb5cd05949900c5978363ac5 (The hash of private-key + BOBKEY123)

read -p "ENCRYPTION KEY: " BOB_PUBLIC_KEY
read -p "FILE TO ENCRYPT: " PRIVATE_KEY_PATH

# Check if the private key file exists
if [[ ! -f "$PRIVATE_KEY_PATH" ]]; then
    echo "Error: File not found at $PRIVATE_KEY_PATH"
    exit 1
fi

# Read the private key
PRIVATE_KEY=$(cat "$PRIVATE_KEY_PATH")
# Combine the private key and Bob's public key, then hash them together
COMBINED_KEYS="$PRIVATE_KEY$BOB_PUBLIC_KEY"
HASHED_RESPONSE=$(echo -n "$COMBINED_KEYS" | md5sum | awk '{print $1}')
# Output the hashed response
echo "ENCRYPTED TEXT: $HASHED_RESPONSE"