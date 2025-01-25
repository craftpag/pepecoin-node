```markdown
# Pepecoin Full Node Docker Image

A Docker container for running a Pepecoin node, helping secure and decentralize the network. The image pulls and compiles Pepecoin Core directly from the official [pepecoinppc/pepecoin](https://github.com/pepecoinppc/pepecoin) GitHub repository.

## Important
To participate as a network node, you must forward port 33873 on your router to accept incoming P2P connections.

## Requirements
- Docker
- Docker Compose

## Quick Start
```bash
docker pull cpag/pepecoin-node:latest
docker-compose up -d
```

## Build from Source
```bash
git clone [your-repo-url]
cd pepecoin-node
docker-compose build
docker-compose up -d
```

## Configuration
Data directory is mounted at `./pepecoin-data/`

Ports:
- 33874 (RPC)
- 33873 (P2P)

## Container Details
- Base: Debian latest
- Compiled from source with all dependencies
- Automatic network synchronization
- Data persistence through Docker volumes
```