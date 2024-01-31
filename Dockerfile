FROM golang AS builder

WORKDIR /build

ARG TARGETOS

ENV CGO_ENABLED=0
ENV GOOS=${TARGETOS:-linux}

RUN printenv

COPY . .

RUN go build -a -installsuffix cgo -o main .
RUN mv main drone-discord

FROM scratch AS runner

LABEL maintainer="Giuseppe Pascale <peppe@codegiik.com>" \
  org.label-schema.name="Drone Discord Plugin" \
  org.label-schema.vendor="pasc4le" \
  org.label-schema.schema-version="1.0"

LABEL org.opencontainers.image.source=https://github.com/pasc4le/drone-discord
LABEL org.opencontainers.image.description="Drone Discord"
LABEL org.opencontainers.image.licenses=MIT

COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/

WORKDIR /app

COPY --from=builder /build/drone-discord .

ENTRYPOINT ["/app/drone-discord"]
