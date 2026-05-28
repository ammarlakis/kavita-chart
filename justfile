precommit:
    pre-commit install

release:
    ./scripts/release.sh

docs:
    helm-docs

fmt:
    prettier --write .

lint:
    helm lint charts/kavita

template:
    helm template kavita charts/kavita
