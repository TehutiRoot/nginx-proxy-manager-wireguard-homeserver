# CLI Cheatsheet – Nginx Proxy Manager

## Docker / Containers
List containers
docker ps

View NPM logs
docker logs -f <npm_container_name>

Restart NPM
docker compose restart

text

## Connectivity tests

From VPS, test access to backend over WireGuard
curl -vk https://10.10.10.20:443
curl -vk http://10.10.10.30:8080

text
undefined
