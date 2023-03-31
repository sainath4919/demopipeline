# Use the official Tomcat image as the base image
FROM tomcat:9.0-jdk8-openjdk-slim

# Copy the WAR file into the container
COPY myproj.war /usr/local/tomcat/webapps/

# Set the default command to start Tomcat
CMD ["catalina.sh", "run"]

# Expose port 8080 for Tomcat
EXPOSE 8080
