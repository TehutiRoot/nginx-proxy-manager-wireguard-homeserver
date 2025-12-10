# Patterns & Pitfalls

## Patterns that work well

- Use the VPS as the single public entry point; keep all home services private behind WireGuard.
- Terminate HTTPS on NPM for most apps, and forward HTTP to the backend.
- Use separate subdomains per app instead of many different ports on a single host.

## Common issues seen in this lab

- **Wrong real IP in logs**  
  - Fix by enabling the "X-Forwarded-For" / "Real IP" options and configuring upstream apps to trust NPM.

- **Double SSL (TLS at NPM and backend)**  
  - Prefer: NPM handles HTTPS, backend uses HTTP; or configure strict passthrough for apps that require end‑to‑end TLS.

- **Forgetting WireGuard routes**  
  - If NPM cannot reach `10.10.10.x`, verify pfSense routes and WG AllowedIPs for the VPS.
