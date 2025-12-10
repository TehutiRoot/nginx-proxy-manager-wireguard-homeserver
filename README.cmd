# Nginx Proxy Manager over WireGuard – Multi‑Service Home Server

## Overview

This project extends the WireGuard + pfSense CGNAT lab by adding **Nginx Proxy Manager (NPM)** on the VPS.  
The VPS terminates HTTPS and acts as a reverse‑proxy gateway for multiple home servers and applications that sit behind pfSense and the existing WireGuard tunnel.

## Goals

- Publish several internal services (dashboards, admin panels, self‑hosted apps) using friendly domains instead of random high ports.  
- Centralise SSL certificates, access control and logging on the VPS.  
- Provide a realistic blueprint for secure home/SME hosting that can be reused for law‑enforcement style labs and freelance infrastructure projects.

## High‑Level Architecture

- **VPS (OCI / Debian)**  
  - Public IP (e.g. 203.0.113.10)  
  - WireGuard endpoint re‑used from the digital‑raid lab  
  - Docker‑based Nginx Proxy Manager listening on ports 80/443

- **pfSense Edge (behind CGNAT)**  
  - Maintains the WireGuard tunnel to the VPS  
  - Routes traffic from the tunnel to multiple internal servers on the LAN

- **Home Servers** (examples)  
  - `10.10.10.20:443` – main web UI  
  - `10.10.10.30:8080` – admin dashboard  
  - `10.10.10.40:9000` – monitoring

Each service is exposed via NPM as `app1.example.com`, `app2.example.com`, etc.

## Repository Layout (planned)

- `docs/` – setup guide for NPM on the VPS, reverse‑proxy patterns and diagrams.  
- `configs/` – sanitised NPM export and example proxy host definitions (mock IPs and domains).  
- `pitfalls/` – notes from running NPM on a home server vs VPS, SSL issues and header handling.

This lab is part of a series together with:

- **Digital Raid Lab – WireGuard & pfSense**  
- **NetBird ZTNA Overlay Lab**

