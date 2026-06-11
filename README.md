# The Overarching Plan for the Challenge

## Step 0: Set it up

An automated script that assembles the challenge. Arrives in a .7z archive that once extracted, provides a handy make and break script.

## Step 1: Connect to Alice

User logs into the Alice container to find their public and private keys, as well as instructions.

## Step 2: Ping Bob

User pings Bob to establish a connection.

First with ping command [?] then later with netcat.

## Step 3: Request Bob Public Key

User sends a netcat request to Bob asking for the Public Key. Bob replies with the public key. Hackerbot9001 records this transaction with termshark.

## Step 4: Send Private Key

User "encrypts" their private key with Bob's public key. [This will likely be sending a pre-recorded md5 hash.] Bob uses this key to encrypt the secret flag.

## Step 5: Get secret.flag

User requests secret.flag. Bob sends encrypted file. User decrypts file to get secret.flag

## Step 6: Hackerbot9001

User logs into Hackerbot 9001 to view what packets it has seen and what information it gathered. User views termshark .pcap file.

## Step 7: 236236HS

Remove everything. Pre-written Script.

---

## Key Information

SSH into Alice through port 2222
SSH into Hackerbot9001 through port 2224
Netcat into Bob through port 8888

## WHOAMI?

### Alice

Hi I'm Alice

Alice is the bot the user logs into

The user needs to be able to log into Alice and send packets to Bob, likely via netcat
(Probably) Needs to have scripts for 'encryption' and 'decryption'

Alice contains all the tools the user needs for sending and receiving messages.

User must log into Alice

### Bob

Hi I'm Bob

Bob is the bot the user is trying to speak with
Bob has the secret.flag

Bob needs to send a public key when requested
Bob needs to be able to 'decrypt' a string that has been 'encrypted' with the public key
Bob needs to be hidden
If Bob receives a non-encrypted message, Bob needs to reply "That's unsecure" or something like that

The User cannot log in to Bob

### Hackerbot9001

Hey I'm Hackerbot9001

HB is the bot sniffing network packets and trying to get the secret.flag from Alice and Bob

HB has Termshark and both public keys.
If it ever gets some information it should not, then it sends a message to Alice

Once the challenge is completed, the user should be able to log into Hackerbot9001 and observe what it saw.
