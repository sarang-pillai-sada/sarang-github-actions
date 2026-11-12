FROM alpine:3.21

RUN adduser -D -u 10001 appuser
USER appuser

CMD ["sh", "-c", "echo Hello from sample container && sleep 5"]
