# Hanamizuki Kubernetes Cluster

A GitOps Repository for My Homelab Kubernetes Clusters.

## Clusters

This repository manages two Kubernetes clusters:

- **Hana**: Production cluster, publicly accessible.
- **Mizuki**: Staging cluster, accessible via a proxy.

## Repository Structure

This repository follows the GitOps methodology using Kustomize to manage configurations.

- `cluster-utilities/`: Contains configurations for cluster-wide services like ArgoCD, Cert-Manager, Dex, etc.
- `apps/`: Contains configurations for applications deployed on the clusters.

Each application or utility has a `base` configuration and cluster-specific `patches` under `patches/hana` and `patches/mizuki`.

- `base/`: Common configuration for all clusters.
- `patches/hana/`: Overlays for the Hana (production) cluster.
- `patches/mizuki/`: Overlays for the Mizuki (staging) cluster.

## Important Links

### Hana (Production)

- **Landing Page**: https://hello.hana.ishiori.net
- **Cluster Login**: https://login.hana.ishiori.net

### Mizuki (Staging)

- **Landing Page**: https://hello.mizuki.otaprv.ishiori.net
- **Cluster Login**: https://login.mizuki.otaprv.ishiori.net

