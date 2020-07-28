# smokeping : network latency grapher 
smokeping service on docker. you can see about smokeping detial [here](https://oss.oetiker.ch/smokeping/).   
SmokePing keeps track of your network latency:   
- Best of breed latency visualisation.   
- Interactive graph explorer.   
- Wide range of latency measurement plugins.   
- Master/Slave System for distributed measurement.   
- Highly configurable alerting system.   
- Live Latency Charts with the most 'interesting' graphs.   
- Free and OpenSource Software written in Perl written by Tobi Oetiker, the creator of MRTG and RRDtool   

# to use docker file   
- docker build . --network=host   

# to run docker   
- docker run -tdi --name smokeping -v /opt/smokeping:/opt/smokeping -p 80:80 docker.pkg.github.com/lillianphyoe/smokeping/smokeping:2.7

# hint   
can change config file under /opt/smokeping/etc/config to add network device to monitor.
