# CLAIR

**Clair** can scan Docker images for security vulnerabilities.

**Klar** is a simple tool to analyze images stored in a private or public Docker registry for security vulnerabilities using Clair.


## Usage

1. Start services: `docker-compose up`
2. Scan image:     `docker-compose run klar quay.io/coreos/clair:v2.0.1`
