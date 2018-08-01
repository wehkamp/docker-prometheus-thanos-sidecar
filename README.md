### Thanos sidecar

This container will simply run the `Thanos` binary with the `sidecar` parameter selected. It's main purpose is to run next to prometheus and periodically ship data to S3.

Upstream: https://github.com/improbable-eng/thanos
