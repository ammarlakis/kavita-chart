# kavita

Helm chart for deploying [Kavita](https://www.kavitareader.com/) on Kubernetes.

Kavita listens on port `5000` and stores its server configuration under
`/kavita/config` when using the official image. Mount your media libraries with
`mediaVolumes` and `mediaVolumeMounts`, then add them as libraries in the Kavita
web UI.

## Install

```sh
helm install kavita ./charts/kavita
```

## Example Values

```yaml
ingress:
  enabled: true
  className: nginx
  hosts:
    - host: kavita.example.com
      paths:
        - path: /
          pathType: Prefix

mediaVolumes:
  - name: books
    persistentVolumeClaim:
      claimName: books

mediaVolumeMounts:
  - name: books
    mountPath: /books
    readOnly: true
```

## Release

```sh
./scripts/release.sh
```

Run from a clean, current `master`. Set `RELEASE_VERSION=0.2.0` to choose a version; otherwise git-cliff calculates it. The script prepares a local release branch without tagging or publishing. Add `--pr` to push that branch and open a draft PR. After review and merge, create the approved version tag separately. See [Maintenance](MAINTENANCE.md) for verification and release gates.
