FROM ubuntu:16.04

#add maintainer IceTegliaf

#RUN addgroup consul && \
#adduser -S -G consul consul

# Set up certificates, our base tools, and Consul.
RUN apt-get update && apt-get install -y wget unzip

RUN wget https://releases.hashicorp.com/consul/0.7.5/consul_0.7.5_linux_amd64.zip
RUN unzip consul_0.7.5_linux_amd64.zip -d /bin
    

# The /consul/data dir is used by Consul to store state. The agent will be started
# with /consul/config as the configuration directory so you can add additional
# config files in that location.
RUN mkdir -p /consul/data && \
    mkdir -p /consul/config
#chown -R consul:consul /consul

# Expose the consul data directory as a volume since there's mutable state in there.
#VOLUME /consul/data
#VOLUME /consul/config
COPY config/ /consul/config/
# Server RPC is used for communication between Consul clients and servers for internal
# request forwarding.
#EXPOSE 8300

# Serf LAN and WAN (WAN is used only by Consul servers) are used for gossip between
# Consul agents. LAN is within the datacenter and WAN is between just the Consul
# servers in all datacenters.
#EXPOSE 8301 8301/udp 8302 8302/udp

# CLI, HTTP, and DNS (both TCP and UDP) are the primary interfaces that applications
# use to interact with Consul.
#EXPOSE 8400 8500 8600 8600/udp

# Consul doesn't need root privileges so we run it as the consul user from the
# entry point script. The entry point script also uses dumb-init as the top-level
# process to reap any zombie processes created by Consul sub-processes.
#COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
#RUN chmod +x /usr/local/bin/docker-entrypoint.sh
#ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
#RUN getip=$(ip a s | grep -E 'inet.*eth1' | awk '{print $2}' | cut -d"/" -f 1)
# By default you'll get an insecure single-node development server that stores
# everything in RAM, exposes a web UI and HTTP endpoints, and bootstraps itself.
# Don't use this configuration for production.
#CMD ["agent", "-dev", "-client", "0.0.0.0"]


#CMD "consul agent -ui -config-dir=/consul/config -data-dir=/consul/data"



#RUN wget https://releases.hashicorp.com/consul/0.7.5/consul_0.7.5_web_ui.zip
#RUN unzip consul_0.7.5_web_ui.zip -d /consul/ui
#RUN rm -rf ./consul_0.7.5_web_ui.zip

WORKDIR /consul




COPY zapuska.sh ./
RUN chmod +x zapuska.sh 

ENTRYPOINT /consul/zapuska.sh

