# Enterprise Deployment Platform - GitOps

This repository contains the GitOps configuration for the **Enterprise Deployment Platform**.

It stores the desired state of the production Kubernetes cluster, including Helm charts, Kubernetes manifests, ArgoCD applications, and monitoring configurations. Rather than deploying directly to the cluster, Jenkins updates the deployment configuration in this repository, and ArgoCD continuously synchronizes the Kubernetes cluster to match the latest Git state.

---

## Architecture

```text
Developer
    │
    ▼
Application Repository
    │
    ▼
Jenkins CI
    │
    ├── Build Docker Image
    ├── Push Docker Image
    └── Update Image Tag
              │
              ▼
      This GitOps Repository
              │
              ▼
           ArgoCD
              │
              ▼
         Amazon EKS
```

---

## Repository Structure

```text
.
├── argocd/
│   └── application.yaml
│
├── helm/
│   └── enterprise-app/
│       ├── Chart.yaml
│       ├── values.yaml
│       ├── values-prod.yaml
│       └── templates/
│
├── monitoring/
│   ├── prometheus-values.yaml
│   ├── alertmanager-config.yaml
│   └── grafana/
│
└── README.md
```

---

## Components

- **ArgoCD** – Synchronizes Kubernetes with Git.
- **Helm** – Packages and templates Kubernetes resources.
- **Kubernetes Manifests** – Production deployment configuration.
- **Monitoring** – Prometheus, Grafana, and Alertmanager configuration.

---

## Deployment Workflow

1. Developer pushes code to the application repository.
2. Jenkins builds and tests the application.
3. Jenkins performs SonarQube and Trivy scans.
4. Jenkins builds and pushes a Docker image.
5. Jenkins updates the image tag in `values-prod.yaml`.
6. Jenkins commits and pushes the change to this repository.
7. ArgoCD detects the new commit.
8. ArgoCD synchronizes the EKS cluster.
9. Kubernetes performs a rolling update of the application.

---

## Technologies

- Kubernetes
- Amazon EKS
- Helm
- ArgoCD
- GitOps
- Prometheus
- Grafana
- Alertmanager

---

## Related Repository

Application Repository:

https://github.com/amalpk531/Enterprise-Deployment-Platform

---

## Author

**Amal P K**
