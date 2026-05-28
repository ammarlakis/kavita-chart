#!/usr/bin/env bash
set -euo pipefail

CHART_FILE="charts/kavita/Chart.yaml"
RELEASE_PUSH="${RELEASE_PUSH:-true}"

if [[ ! -f "${CHART_FILE}" ]]; then
  echo "Chart file not found: ${CHART_FILE}" >&2
  exit 1
fi

if [[ -n "${RELEASE_VERSION:-}" ]]; then
  raw_version="${RELEASE_VERSION}"
else
  raw_version="$(git cliff --bumped-version)"
fi

if [[ -z "${raw_version}" ]]; then
  echo "Could not determine next version" >&2
  exit 1
fi

if [[ "${raw_version}" == v* ]]; then
  tag="${raw_version}"
  new_version="${raw_version#v}"
else
  new_version="${raw_version}"
  tag="v${raw_version}"
fi

if [[ ! "${tag}" =~ ^v[0-9]+\.[0-9]+\.[0-9]+([-+][0-9A-Za-z.-]+)?$ ]]; then
  echo "Release tag must look like v0.1.0: ${tag}" >&2
  exit 1
fi

if git rev-parse "${tag}" >/dev/null 2>&1; then
  echo "Tag ${tag} already exists" >&2
  exit 1
fi

echo "Preparing release ${tag}"
echo "Updating ${CHART_FILE}..."
sed -i.bak "s/^version: .*/version: ${new_version}/" "${CHART_FILE}"
rm -f "${CHART_FILE}.bak"

if command -v helm-docs >/dev/null 2>&1; then
  echo "Regenerating Helm docs..."
  helm-docs
else
  echo "helm-docs not found; keeping existing README files"
fi

if command -v prettier >/dev/null 2>&1; then
  echo "Formatting markdown..."
  prettier README.md charts/kavita/README.md -w --ignore-unknown 2>/dev/null || prettier README.md -w
fi

echo "Updating CHANGELOG.md with git-cliff..."
git cliff --unreleased --tag "${tag}" --prepend CHANGELOG.md

git add "${CHART_FILE}" CHANGELOG.md README.md charts/kavita/README.md 2>/dev/null || git add "${CHART_FILE}" CHANGELOG.md README.md

git commit --no-verify -m "chore: prepare for ${new_version} #ignore" || {
  echo "Nothing to commit; aborting" >&2
  exit 1
}

echo "Creating tag ${tag} on HEAD..."
git tag "${tag}"

if [[ "${RELEASE_PUSH}" == "true" ]]; then
  echo "Pushing commit and tag to origin..."
  git push origin HEAD
  git push origin "${tag}"
else
  echo "RELEASE_PUSH=false; leaving commit and tag local."
fi

echo "Done. Released ${tag}."
