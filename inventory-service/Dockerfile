
# Build stage
FROM golang:1.26-alpine AS builder

WORKDIR /app

# Copy dependency files first
COPY go.mod go.sum ./

RUN go mod download

# Copy source code
COPY . .

# Build executable
RUN CGO_ENABLED=0 GOOS=linux go build -trimpath -ldflags="-s -w" -o inventory-service .


# Production stage
FROM gcr.io/distroless/static-debian12:nonroot

WORKDIR /

COPY --from=builder /app/inventory-service /inventory-service

USER nonroot:nonroot

EXPOSE 8081

HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD ["/inventory-service", "-healthcheck"]

ENTRYPOINT ["/inventory-service"]
