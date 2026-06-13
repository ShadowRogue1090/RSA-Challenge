#!/bin/bash

## Input: Alice's private key (private-key, provide filepath) and Bob's responce (098f6bcd4621d373cade4e832627b4f6)
## Output: ctfd{2dd9241bb3f20fe40c4102e884f9f379} and message about logging in as hackerbot9001

read -p "DECRYPTION KEY: " PRIVATE_KEY_PATH
read -p "MESSAGE TO DECRYPT: " BOB_RESPONSE

# Check if the private key file exists
if [[ ! -f "$PRIVATE_KEY_PATH" ]]; then
    echo "Error: File not found at $PRIVATE_KEY_PATH"
    exit 1
fi  

# Read the private key
PRIVATE_KEY=$(cat "$PRIVATE_KEY_PATH")

# If the hash of Bob's response matches the expected hash, output the decrypted message and hint
EXPECTED_HASH="098f6bcd4621d373cade4e832627b4f6"
if [[ "$BOB_RESPONSE" == "$EXPECTED_HASH" ]]; then
    echo "DECRYPTED MESSAGE: ctfd{2dd9241bb3f20fe40c4102e884f9f379}"
    echo -e "HINT: You Are (Not) Alone.\n hackerbot9001:hackerbot9001 port 2224"
else
    echo "Error: Decryption failed."
fi

