13/06/2026

The issue at hand was (and still is) that a user can just run cat decrypt.sh and get the flag without doing the challenge.
Originally I intended to make it so the user could execute but not read the files, however that does not work. Read permissions are necessary for execution.
The next idea I had was to convert the scripts to binaries like previous ctfd challenges I have done before.
Unfortuantely I had never done this before and had to learn on the go.

I found that I could use shc to convert a bash script into C code and a binary quickly, and made a couple of binaries to upload to Alice.
Unfortunatly the binaries were build with a newer version of some library than the docker container, so I had to change plans.
Changing the base docker image broke the rest of the config so I had to stick with debian:bookworm-slim or rewrite my setup script and Dockerfile.

What I did find was I could build the binaries with another temporary docker container using an identical debian installation and copy them across.
I managed to get it to work perfectly twice, however for a reason I am still unaware of, it would seemingly randomly have an error and output broken characters.
After spending a lot of time trying various approaches (including generating the binaries in the Alice Dockerfile, generating them with various different environments and not using docker at all) the same failed output kept reappearing.
Seeing that it was not a fundamental issue and the challenge still worked, as well as how much time this has consumed, I think I will leave the scripts as just bash and as long as they run, work with that.
