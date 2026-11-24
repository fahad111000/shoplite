
# Build stage
FROM maven:3.9.9-eclipse-temurin-21-alpine AS builder

WORKDIR /app

# Copy Maven configuration first
COPY pom.xml .

# Download dependencies
RUN mvn -B dependency:go-offline

# Copy Java source code
COPY src ./src

# Build executable JAR
RUN mvn -B -DskipTests package


# Production stage
FROM eclipse-temurin:21-jre-alpine

WORKDIR /app

# Install wget for health check
RUN apk add --no-cache wget

# Create non-root user
RUN addgroup -S app && adduser -S app -G app

# Copy only the executable JAR
COPY --from=builder --chown=app:app /app/target/order-service.jar ./order-service.jar

USER app

EXPOSE 8082

# Check application health
HEALTHCHECK --interval=30s --timeout=5s --start-period=40s --retries=3 \
  CMD wget -q --spider http://127.0.0.1:8082/health || exit 1

CMD ["java", "-jar", "order-service.jar"]
