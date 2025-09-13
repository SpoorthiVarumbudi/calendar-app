FROM eclipse-temurin:17-jdk

WORKDIR /app

COPY . .

# Ensure mvnw is executable
RUN chmod +x mvnw

RUN ./mvnw clean package -DskipTests

CMD ["java", "-jar", "target/calendar-app-0.0.1-SNAPSHOT.jar"]
