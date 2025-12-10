# Setup Guide – Nginx Proxy Manager on WireGuard VPS

## 1. Prerequisites

- Existing WireGuard tunnel between VPS and pfSense (see digital‑raid lab).  
- VPS: Debian/Ubuntu with public IP (e.g. 203.0.113.10).  
- Docker and Docker Compose installed.

## 2. Deploy Nginx Proxy Manager (NPM)

1. Create a directory, e.g. `/opt/npm`.
2. Place a `docker-compose.yml` (see `configs/docker-compose.npm.example.yml`).
3. Start the stack:

cd /opt/npm
docker compose up -d


4. Log in to the NPM web UI at `http://203.0.113.10:81` and change the default admin password.

## 3. Connect to Home Servers via WireGuard

Example internal services behind pfSense:

- `10.10.10.20:443` – main HTTPS service  
- `10.10.10.30:8080` – dashboard  
- `10.10.10.40:9000` – monitoring

Ensure pfSense routes and firewall rules allow traffic from the VPS WireGuard IP (e.g. 10.100.0.1) to these hosts.

## 4. Create Proxy Hosts in NPM

Example mappings:

- `app1.example.com` → `https://10.10.10.20:443` (SSL passthrough or re‑encrypted)  
- `app2.example.com` → `http://10.10.10.30:8080` (NPM handles HTTPS with Let’s Encrypt)  
- `monitor.example.com` → `http://10.10.10.40:9000`

For each Proxy Host:

- Domain Names: set FQDN.  
- Scheme/Forward Hostname/IP: internal IP.  
- Enable **Websockets support** and **Block common exploits** as needed.  
- Under SSL: request a Let’s Encrypt certificate or use an existing one.

## 5. DNS

In Cloudflare (or other DNS):

- Create `A` records pointing `app1.example.com`, `app2.example.com`, etc. to `203.0.113.10`.  
- Wait for propagation and test from an external client.



