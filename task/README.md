# Student Assignment — Deploy a Flask Application Using Terraform, Ansible, Docker, and Proxmox

## Objective

In this assignment, you will:

- Provision infrastructure using Terraform
- Configure systems using Ansible
- Deploy containers using Docker
- Host virtual machines on Proxmox VE
- Deploy a production-style Flask web application connected to PostgreSQL

---

# Scenario

Your team has been asked to automate the deployment of a small internal web application.

The application must:

- Run inside Docker containers
- Store messages in PostgreSQL
- Be deployed automatically
- Run on infrastructure provisioned through Terraform
- Be configured through Ansible

---

# Infrastructure Requirements

You must create the following virtual machines:

| VM Name | Purpose |
|---|---|
| web-01 | Flask application + Docker |
| db-01 | PostgreSQL database |
| monitor-01 | Monitoring tools |

Use Ubuntu Server 24.04 cloud images.

---

# Application Requirements

The Flask application must:

- Display a homepage
- Allow users to submit messages
- Store messages in PostgreSQL
- Display submitted messages
- Run inside Docker

---

# Part 1 — Flask Application

## File Structure

```text
studentapp/
├── app.py
├── requirements.txt
├── Dockerfile
├── docker-compose.yml
├── .dockerignore
└── templates/
    └── index.html
```

---


   
# requirements.txt

```text
flask
psycopg2-binary
gunicorn
```
# Build and Run Steps

## Build Containers

```bash
docker compose build
```

## Start Application

```bash
docker compose up -d
```

## Verify Running Containers

```bash
docker ps
```

## Test Application

```bash
curl http://localhost:5000
```

---

# Terraform Tasks

Students must:

- Configure the Proxmox provider
- Create Ubuntu cloud-init VMs
- Configure networking
- Configure SSH keys
- Deploy web-01, db-01, and monitor-01 automatically

---

# Ansible Tasks

Students must automate:

## web-01

- Docker installation
- Docker Compose installation
- Copying application files
- Starting containers

## db-01

- PostgreSQL setup
- Firewall configuration

## monitor-01

- Install monitoring utilities

---

# Deliverables

Students must submit:

- Terraform code
- Ansible playbooks
- Flask application files
- Docker configuration
- Screenshots of working deployment
- README documentation
- Git repository URL

---

# Validation Checklist

| Requirement | Status |
|---|---|
| Terraform provisions VMs | ☐ |
| Ansible configures systems | ☐ |
| Docker containers build successfully | ☐ |
| Flask app accessible in browser | ☐ |
| PostgreSQL stores messages | ☐ |
| Application survives container restart | ☐ |
| Infrastructure reproducible | ☐ |

---

# Bonus Challenges

Optional improvements:

- HTTPS with Nginx
- Docker image publishing
- CI/CD pipeline
- Multi-container scaling
- Reverse proxy setup
- Monitoring dashboards
- Automatic backups
