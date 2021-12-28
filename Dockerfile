FROM maven:3-openjdk-8 as sree45
WORKDIR /project
COPY . .
RUN mvn clean package

FROM tomcat:9
COPY --from=sree45 /project/target/*.war /usr/local/tomcat/webapps
EXPOSE 8080
