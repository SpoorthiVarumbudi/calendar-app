# Use a Java 17 base image
FROM eclipse-temurin:17-jdk

# Set working directory
WORKDIR /app

# Copy all project files
COPY . .

# Ensure Maven wrapper is executable
RUN chmod +x mvnw

# Build the app and repackage the Spring Boot fat JAR
RUN ./mvnw clean package spring-boot:repackage -DskipTests

# Expose port from environment variable
ENV PORT=8080
EXPOSE $PORT

# Run the Spring Boot fat JAR
CMD ["java", "-jar", "target/calendar-app-0.0.1-SNAPSHOT.jar"]
