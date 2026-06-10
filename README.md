The Overarching Plan for the Challenge
Step 0: Set it up

An automated script that assembles the challenge. Arrives in a .7z archive that once extracted, provides a handy make and break script.
Step 1: Connect to Alice

User logs into the Alice container to find their public and private keys, as well as instructions.
Step 2: Ping Bob

User pings Bob to establish a connection.

First with ping command [?] then later with netcat.
Step 3: Request Bob Public Key

User sends a netcat request to Bob asking for the Public Key. Bob replies with the public key. Hackerbot9001 records this transaction with termshark.
Step 4: Send Private Key

User "encrypts" their private key with Bob's public key. [This will likely be sending a pre-recorded md5 hash.] Bob uses this key to encrypt the secret flag.
Step 5: Get secret.flag

User requests secret.flag. Bob sends encrypted file. User decrypts file to get secret.flag
Step 6: Hackerbot9001

User logs into Hackerbot 9001 to view what packets it has seen and what information it gathered. User views termshark .pcap file.
Step 7: 236236HS

Remove everything. Pre-written Script.
