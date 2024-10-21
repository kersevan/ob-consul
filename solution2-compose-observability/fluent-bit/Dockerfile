ARG FLUENTBIT_DOCKER_IMAGE=$FLUENTBIT_DOCKER_IMAGE
FROM gcr.io/distroless/base:debug AS distroless-base
# FROM fluent/fluent-bit:1.9.1

# FROM fluent/fluent-bit:$FLUENTBIT_DOCKER_IMAGE
FROM $FLUENTBIT_DOCKER_IMAGE

# Add WGET for healthcheck
COPY --from=distroless-base ["/busybox/wget", "/wget"]
EXPOSE 2020
EXPOSE 24224

HEALTHCHECK --interval=10s --start-period=10s --retries=5 --timeout=2s CMD ["/wget", "--quiet", "--output-document=-", "http://localhost:2020/api/v1/health"]
