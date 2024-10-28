# Consul Cluster with Monitoring Stack

This repository contains a production-ready solution for deploying a 4-node Consul cluster with comprehensive monitoring capabilities. The solution is containerized using Docker Compose and includes additional monitoring and logging components for production-grade observability.

Solutions 1 and 2 are based on docker-compose, solution 3 is based on helm
Solutions 1 and 3 contain only consul, while solution2 contains more broad observability deployment.

## Architecture solution2

### Core Components
- 4-node Consul cluster for service discovery and health checking
- Each node runs in a separate container for isolation
- UI accessible via the leader node
- Service mesh capabilities enabled via Consul Connect

### Monitoring Stack
- Prometheus for metrics collection
- Grafana for visualization
- Fluent-bit for log aggregation
- Loki for log storage and querying
- cAdvisor for container metrics
- Node Exporter for host metrics

- Port availability:
  - 8500 (Consul UI)
  - 3000 (Grafana)
  - 9090 (Prometheus)
  - 24224 (Fluent-bit)

## Quick Start

1. Clone the repository

2. Update environment variables in `.env` and `.decrypted.secrets.env`

3. For docker compose:
Start the cluster:
```bash
docker-compose up -d
```

For helm:
```bash
helm install consul ./consul
or
helm upgrade consul ./consul

```

4. Compose: Verify the cluster status:
```bash
docker exec outbrain_consul_node1 consul members list
```

for helm:
```
minikube service consul-ui
```
## Configuration Files

### Consul Configuration
- `consul/config-nodes/` - Contains node-specific configurations
- `consul/config-services/` - Contains service definitions
- Each node has its own configuration file (node1.json through node4.json)

### Monitoring Configuration
- `prometheus/` - Prometheus configuration and rules
- `grafana/` - Dashboards and data sources
- `fluent-bit/` - Log collection configuration
- `loki/` - Log aggregation settings

## Accessing Services

- Consul UI: http://localhost:8500
- Grafana: http://localhost:3000
- Prometheus: http://localhost:9090

## Troubleshooting compose

1. Check cluster status:
```bash
docker exec outbrain_consul_node1 consul operator raft list-peers
```

2. View logs:
```bash
docker-compose logs -f [service_name]
```

3. Check service health:
```bash
docker-compose ps
```
