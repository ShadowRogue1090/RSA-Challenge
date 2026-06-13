11/06/2026

I have just completely overhauled how the containers interact and the purpose of hackerbot in the final structure.

Up until now I assumed I could just have one network, all three containers, and termshark sniffing packets between alice and bob. As it turns out, there is a permission issue somewhere with rootless docker where hackerbot can capture all packets to or from hackerbot, but not between the other two containers. As such, I cannot have a spy listening into the conversation.

Instead I am moving to a man in the middle attack type structure. Instead of one network, I have hackerbot as a relay between alice and bob, with two networks, one between each. Alice <---> Hackerbot9001 <---> Bob
Hackerbot can then just record the specific packets it relays instead of the mess I was previously recording. I have a python script that relays and records the packets and can display them in termshark.
At first I had the packets output to a log, but found there was a python package I could import to convert them into a full .pcap file.

Once noticable difference between Alice talking directly to Bob and having hackerbot proxy, is the netcat command does not go back to a new terminal line on its own, and required CTRL + C to cancel and end the conncetion.

The biggest weakness of this system is that hackerbot is not essential to the challenge whereas before alice and bob could talk to each other just fine. This means if there is an issue with hackerbot, which technically does not contribute to getting the final flag, then the whole challenge goes down. Fortunately, being that I have one script to assemble the full challenge and take it down, if there is an issue, I think it should be as easy as just rebuilding. I was hoping to provide the images for the challenge pre-built to hasten the launch process, but I am having to make too many changes and it is just not worth it right now. Maybe at the end I can create an alternate script that comes with the images pre-built. But, having to build the images in the setup process does show off the process better, at the cost of more time. Testing the proxy system with the various faulty approaches I had took a long time, as there was a minute of compliling and ~5 minutes of resetting and getting into the challenge. In hindsight, I should have built the setup script to be more modular and not build or destroy the entire challenge as once, as one small test in alice required building all of hackerbot (a lot longer).
