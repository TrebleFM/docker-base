# docker-base

Built on `buildpack-deps:jessie`, this image provides tools to aid in debugging via `docker exec`, as well as some easy-to-use scripts for installing `go`, `nginx`, and `node`. This is particularly useful for projects which need access to two or more of these programs and therefore can't easily use the official Docker images.

For a list of installed packages, see the `Dockerfile`.
