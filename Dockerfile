FROM golang:1.10.2-alpine3.7 as builder
COPY . /go/src/tfplan-json
RUN go install tfplan-json

FROM alpine:3.7
COPY --from=builder /go/bin/tfplan-json /usr/local/bin/tfplan-json
ENTRYPOINT ["/usr/local/bin/tfplan-json"]
