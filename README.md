# Ready... Set... ALICE!?

On the network is Bob.

You need to talk to Bob and receive the secret flag Bob is holding.

Unfortunately you are not certain if the network is secure or not, and Bob is not willing to send you the flag if it is not safe.

Log into Alice:

```bash
ssh alice@localhost -p 2222
ls
```

In this directory you will find all the tools you need:

- A Script to Encrypt Messages to Bob
- A Script to Decrypt Bob's replies
- Your Private Key (TELL NOBODY!)

**Start by requesting Bob's Public Key.**

```bash
nc bob 8888

Requesting Public Key
```

_By definition, anyone can see the Public Key, therefore it is safe to send unencrypted.
The goal is to establish safe communications using your Private Key._

**Use Bob's Public Key to encrypt your private key and send it back.**

```bash
./encrypt

nc bob 8888
# Your Reply
```

_Don't worry though, Bob can decrypt it and will know what to do!_

**Decrypt Bob's Reply**

```bash
./decrypt
```

_Who knows what Bob will say?_

**HINT: .pcap files can be read with termshark**
