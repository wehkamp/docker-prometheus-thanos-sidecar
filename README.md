### Thanos sidecar

This container will simply run the `Thanos` binary with the `sidecar` parameter selected. It's main purpose is to run next to prometheus and periodically ship data to S3.

Upstream: https://github.com/improbable-eng/thanos

## Howto:
You'll need a properly configured EC2 instance profile for this to work. After that launch the `sidecar` like this:

```
$ docker run --rm -p 10902:10902 wehkamp/prometheus-thanos-sidecar:0.1.0.rc2 --prometheus.url=http://prometheus.service.consul:9090 --s3.bucket=xxxxx --s3.endpoint=s3.eu-west-1.amazonaws.com
```