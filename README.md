### Thanos sidecar

This container will simply run the `Thanos` binary with the `sidecar` parameter selected. It's main purpose is to run next to prometheus and periodically ship data to S3.

Upstream: https://github.com/improbable-eng/thanos

## Howto:
You'll need a properly configured EC2 instance profile for this to work. After that launch the `sidecar` like this:

```
$ docker run \
  --rm \
  -p 10902:10902 \
  -v /services/prometheus-data/tsdb/:/tsdb:rw \
  wehkamp/prometheus-thanos-sidecar:git-e5ac1e0 \
    --prometheus.url=http://prometheus.service.consul:9090 \
    --s3.bucket=metrics \
    --s3.endpoint=s3.eu-west-1.amazonaws.com \
    --tsdb.path="/tsdb"
```

Example IAM policy that may be attached to the prometheus EC2 instance:

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": "s3:*",
            "Resource": [
                "arn:aws:s3:::metrics/*",
                "arn:aws:s3:::metrics"
            ]
        }
    ]
}
```
