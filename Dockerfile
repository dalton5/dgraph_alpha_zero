FROM alpine:latest AS parallel

RUN apk add --no-cache parallel

FROM dgraph/dgraph:latest

COPY --from=parallel /usr/bin/parallel /usr/bin/parallel

COPY --chmod=755 start.sh /scripts/start.sh

ENTRYPOINT ["/bin/sh"]

CMD ["/scripts/start.sh"]