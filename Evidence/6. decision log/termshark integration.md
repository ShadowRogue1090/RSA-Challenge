29/5/2026

While it is not necessary to the solving of the challenge, I wanted to find a way to put some form of termshark and packet capturing in my challenge.

Being this challenge is designed to demonstrate the importance of secure and encrypted communications, why not have a hacker listening into everything.
I have created a third container called Hackerbot9001 that will record packets on the network and record them in a .pcap that can be later viewed by the user after solving the challenge and learning they can ssh in to hackerbot9001.
The container is both a python script and a ssh-able environment that constantly records the relayed communications between Alice and Bob, converts them to a single .pcap file and updates it as more transmissions are recorded.

In this instance termshark and wireshark are not actually capturing packets but displaying them, as the python scripts handles the .pcap generation. I found this was a cleaner and simpler approach than trying to run termshark in the background constantly and then also when the user wants to view the packets. This also allows for a cleaner .pcap as I originally was expecting to have to filter the packets. When I was running termshark without the python script on the internal network, it captured hundreds of empty ssh packets and filled up too fast to be practical.
