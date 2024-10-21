This file provides instructions on how to use the script and deploy the Consul cluster.

# Consul Cluster Setup

This project sets up a Consul cluster with 4 nodes using Docker Compose. Each node runs in a separate container and forms a fully working Consul cluster. Consul is used for service discovery and configuration.

## Prerequisites

- Docker
- Docker Compose

## How to Use
Starting Consul cluster

docker-compose up -d

Waiting for Consul servers to start.

Checking cluster status.
docker exec consul-server1 consul members

Access the Consul UI by opening the following URL in your browser:
http://localhost:8500

To stop and remove the cluster:
docker-compose down

Configuration Details

Cluster Size: 4 nodes (1 bootstrap node, 3 additional servers)
Data Center: dc1
Consul UI: Available on http://localhost:8500
Network Ports:
    8500: Consul UI
    8600: DNS Interface (UDP)
