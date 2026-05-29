# kavita

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v0.9.0.2](https://img.shields.io/badge/AppVersion-v0.9.0.2-informational?style=flat-square)

Kavita reading server

**Homepage:** <https://www.kavitareader.com/>

## Maintainers

| Name        | Email | Url                             |
| ----------- | ----- | ------------------------------- |
| Ammar Lakis |       | <https://github.com/ammarlakis> |

## Source Code

- <https://github.com/Kareadita/Kavita>
- <https://wiki.kavitareader.com/>

## Values

| Key                                | Type   | Default                                                                | Description                                                                              |
| ---------------------------------- | ------ | ---------------------------------------------------------------------- | ---------------------------------------------------------------------------------------- |
| affinity                           | object | `{}`                                                                   | Pod affinity rules.                                                                      |
| commonAnnotations                  | object | `{}`                                                                   | Additional annotations applied to all resources.                                         |
| commonLabels                       | object | `{}`                                                                   | Additional labels applied to all resources.                                              |
| env                                | object | `{}`                                                                   | Environment variables rendered as literal values.                                        |
| envFrom                            | list   | `[]`                                                                   | Additional envFrom sources.                                                              |
| extraEnv                           | list   | `[]`                                                                   | Additional environment variables. Supports value and valueFrom entries.                  |
| extraVolumeMounts                  | list   | `[]`                                                                   | Additional volume mounts.                                                                |
| extraVolumes                       | list   | `[]`                                                                   | Additional volumes.                                                                      |
| fullnameOverride                   | string | `""`                                                                   | Override the full generated resource name.                                               |
| image.digest                       | string | `""`                                                                   | Kavita image digest. When set, the rendered image uses repository@digest.                |
| image.pullPolicy                   | string | `"IfNotPresent"`                                                       | Kubernetes image pull policy.                                                            |
| image.repository                   | string | `"ghcr.io/kareadita/kavita"`                                           | Kavita image repository.                                                                 |
| image.tag                          | string | `"v0.9.0.2"`                                                           | Kavita image tag.                                                                        |
| imagePullSecrets                   | list   | `[]`                                                                   | Image pull secrets for private registries.                                               |
| ingress.annotations                | object | `{}`                                                                   | Ingress annotations.                                                                     |
| ingress.className                  | string | `""`                                                                   | Ingress class name. If empty, the cluster default is used.                               |
| ingress.enabled                    | bool   | `false`                                                                | Enable an Ingress resource.                                                              |
| ingress.hosts                      | list   | `[{"host":"kavita.local","paths":[{"path":"/","pathType":"Prefix"}]}]` | Ingress host rules.                                                                      |
| ingress.tls                        | list   | `[]`                                                                   | Ingress TLS configuration.                                                               |
| livenessProbe.enabled              | bool   | `true`                                                                 | Enable the liveness probe.                                                               |
| livenessProbe.failureThreshold     | int    | `5`                                                                    | Liveness probe failure threshold.                                                        |
| livenessProbe.initialDelaySeconds  | int    | `30`                                                                   | Initial liveness probe delay in seconds.                                                 |
| livenessProbe.path                 | string | `"/"`                                                                  | HTTP path for the liveness probe.                                                        |
| livenessProbe.periodSeconds        | int    | `30`                                                                   | Liveness probe period in seconds.                                                        |
| livenessProbe.timeoutSeconds       | int    | `5`                                                                    | Liveness probe timeout in seconds.                                                       |
| mediaVolumeMounts                  | list   | `[]`                                                                   | Additional media/library volume mounts.                                                  |
| mediaVolumes                       | list   | `[]`                                                                   | Additional media/library volumes.                                                        |
| nameOverride                       | string | `""`                                                                   | Override the chart name used in generated resource names.                                |
| nodeSelector                       | object | `{}`                                                                   | Node selector for scheduling.                                                            |
| persistence.accessModes            | list   | `["ReadWriteOnce"]`                                                    | PVC access modes.                                                                        |
| persistence.annotations            | object | `{}`                                                                   | PVC annotations.                                                                         |
| persistence.enabled                | bool   | `true`                                                                 | Persist Kavita configuration and database files.                                         |
| persistence.existingClaim          | string | `""`                                                                   | Existing PVC name to use instead of creating one.                                        |
| persistence.labels                 | object | `{}`                                                                   | PVC labels.                                                                              |
| persistence.mountPath              | string | `"/kavita/config"`                                                     | Container path for Kavita configuration. Use /config for the LinuxServer image.          |
| persistence.size                   | string | `"5Gi"`                                                                | PVC size for Kavita configuration.                                                       |
| persistence.storageClass           | string | `""`                                                                   | StorageClass for the PVC. Set to "-" to request an empty storageClassName.               |
| podAnnotations                     | object | `{}`                                                                   | Pod annotations.                                                                         |
| podLabels                          | object | `{}`                                                                   | Additional pod labels.                                                                   |
| podSecurityContext                 | object | `{}`                                                                   | Pod security context.                                                                    |
| priorityClassName                  | string | `""`                                                                   | Pod priority class name.                                                                 |
| readinessProbe.enabled             | bool   | `true`                                                                 | Enable the readiness probe.                                                              |
| readinessProbe.failureThreshold    | int    | `3`                                                                    | Readiness probe failure threshold.                                                       |
| readinessProbe.initialDelaySeconds | int    | `10`                                                                   | Initial readiness probe delay in seconds.                                                |
| readinessProbe.path                | string | `"/"`                                                                  | HTTP path for the readiness probe.                                                       |
| readinessProbe.periodSeconds       | int    | `10`                                                                   | Readiness probe period in seconds.                                                       |
| readinessProbe.timeoutSeconds      | int    | `3`                                                                    | Readiness probe timeout in seconds.                                                      |
| replicaCount                       | int    | `1`                                                                    | Number of Kavita replicas. Use 1 when persistence is enabled with ReadWriteOnce storage. |
| resources                          | object | `{}`                                                                   | Container resource requests and limits.                                                  |
| runtimeClassName                   | string | `""`                                                                   | RuntimeClass name for the pod.                                                           |
| securityContext                    | object | `{}`                                                                   | Container security context.                                                              |
| service.annotations                | object | `{}`                                                                   | Additional Service annotations.                                                          |
| service.labels                     | object | `{}`                                                                   | Additional Service labels.                                                               |
| service.port                       | int    | `5000`                                                                 | Service port.                                                                            |
| service.targetPort                 | int    | `5000`                                                                 | Container HTTP port.                                                                     |
| service.type                       | string | `"ClusterIP"`                                                          | Kubernetes Service type.                                                                 |
| serviceAccount.annotations         | object | `{}`                                                                   | Service account annotations.                                                             |
| serviceAccount.automount           | bool   | `false`                                                                | Automount the service account token into the pod.                                        |
| serviceAccount.create              | bool   | `false`                                                                | Create a dedicated service account.                                                      |
| serviceAccount.name                | string | `""`                                                                   | Service account name. If empty and create is true, a name is generated.                  |
| startupProbe.enabled               | bool   | `true`                                                                 | Enable the startup probe.                                                                |
| startupProbe.failureThreshold      | int    | `30`                                                                   | Startup probe failure threshold.                                                         |
| startupProbe.path                  | string | `"/"`                                                                  | HTTP path for the startup probe.                                                         |
| startupProbe.periodSeconds         | int    | `10`                                                                   | Startup probe period in seconds.                                                         |
| startupProbe.timeoutSeconds        | int    | `5`                                                                    | Startup probe timeout in seconds.                                                        |
| timezone                           | string | `"Europe/Berlin"`                                                      | Timezone passed as the TZ environment variable.                                          |
| tolerations                        | list   | `[]`                                                                   | Pod tolerations.                                                                         |
| topologySpreadConstraints          | list   | `[]`                                                                   | Pod topology spread constraints.                                                         |
| updateStrategy.type                | string | `"Recreate"`                                                           | Deployment update strategy type.                                                         |

---

Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
