# LoadBalancedApi

This project demonstrates a simple **ASP.NET Core Web API** running in **multiple Docker containers** behind an **NGINX reverse proxy**.  
It shows how load balancing works in practice by returning the container instance ID and counting how many requests each replica serves.

---

## Features

- ASP.NET Core Web API with a single endpoint (`/`)
- Returns:
  - `InstanceId`: the container name/ID
  - `RequestsServed`: number of requests handled by that replica
- Docker Compose setup with **2 replicas** of the API
- NGINX configured for **round-robin load balancing**
- Benchmarking using `ab` or `wrk`

---

## Prerequisites

- [.NET 8 SDK](https://dotnet.microsoft.com/download)
- [Docker Desktop](https://www.docker.com/products/docker-desktop)
- [Visual Studio Code](https://code.visualstudio.com/)
- (Optional) Benchmarking tools:
  - [ApacheBench (ab)](https://httpd.apache.org/docs/2.4/programs/ab.html)
  - [wrk](https://github.com/wg/wrk)

---

## Run Locally

Follow these steps to run the project:

# 1. Clone the repository

# 2. Build the Docker image

docker-compose up --build

# 3. Access the API through the localhost
