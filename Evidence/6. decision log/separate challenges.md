13/05/2026

Matt, Josh and I have been discussing how we want to make our challenges work together.

The first idea I proposed was each of us designing a docker container, Alice, Bob and Eve, and then putting them together. The issue here, as Matt and I pointed out, is that last year we build a challenge that was dependent on both our parts.
This complicated the marking and identifying who did what. So instead of having three thirds that interlock for one challenge, we decided to make three separate challenges where the output from one is feeing into another. I suspected the structure would go Josh --> Matt --> Me, however it seems we are reversing that order so I start it all. In hindsight, this should work better as I the only way I can see having an input is making the flag output from the previous challenge, the private key for this one. While tha could work, I prefer uploading the key during the docker image initialisation as it is more convinient for the user.

This also allows us to play into our strengths more. Josh is newer to networking and not very familiar with many of the fundamental concepts, so a bash/os related challenge would work in his favour.
I want to explore docker more so I get to make a challenge with multiple interacting containers, requiring separate files, an internal network, and python scripts as well. Everything except for volumes.
