FROM tomcat:9-jdk17
# Copy the Maven-built WAR file to Tomcat's webapps directory
RUN rm -rf /usr/local/tomcat/webapps/*
COPY target/jpetstore.war /usr/local/tomcat/webapps/ROOT.war
# Expose port 8080
EXPOSE 8080
# Run Tomcat
CMD ["catalina.sh", "run"]
