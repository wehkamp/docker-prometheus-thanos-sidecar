FROM golang:1.10 as builder

# Change the LABEL accordingly.
ENV THANOS_REV=e5ac1e0

RUN LAYER=build \
  && mkdir -p ${GOPATH}/src/github.com/improbable-eng \
  && cd ${GOPATH}/src/github.com/improbable-eng \
  && git clone https://github.com/improbable-eng/thanos.git \
  && cd thanos \
  && git checkout ${THANOS_REV} \
  && go get -v -d ... \
  && make \
  && cp thanos /bin/

FROM wehkamp/alpine:3.7
EXPOSE 10902
ENTRYPOINT ["thanos", "sidecar"]
COPY --from=builder /bin/thanos /bin/thanos

LABEL container.name="wehkamp/prometheus-thanos-sidecar:git-e5ac1e0"
