# Multistage Docker Build Cache using skaffold (alternative solution)

This repo demonstates how skaffold works with environment variables in the configuration parameter `build.artifacts[*].docker.cacheFrom`.

Issue: https://github.com/GoogleContainerTools/skaffold/issues/6809
Skaffold version: v1.34.0
OS: MacOS

## Docker cacheFrom using static docker images

To check this run commands bellow (it works as expected):

```bash
export SKAFFOLD_DEFAULT_REPO=<your docker repo> 
source .envrc
skaffold build -p dev --cache-artifacts=false
```

> You need to change the `<your docker repo>` to the appropriate repository.

## Docker cacheFrom using environment variables

To check this run commands bellow (it fails):

```bash
export SKAFFOLD_DEFAULT_REPO=<your docker repo>  
source .envrc
skaffold build -p branch --cache-artifacts=false
```

> You need to change the `<your docker repo>` to the appropriate repository.

**The error**:

```
getting imageID for "{{.SKAFFOLD_DEFAULT_REPO}}/multistage-build-and-cache:{{.GIT_BRANCH_DASH}}-builder-cache": getting imageID for {{.SKAFFOLD_DEFAULT_REPO}}/multistage-build-and-cache:{{.GIT_BRANCH_DASH}}-builder-cache: Error response from daemon: no such image: {{.SKAFFOLD_DEFAULT_REPO}}/multistage-build-and-cache:{{.GIT_BRANCH_DASH}}-builder-cache: invalid reference format
```
