# Sử dụng image Tomcat chính thức
FROM tomcat:11.0.0

# Copy file WAR vào thư mục webapps của Tomcat
COPY target/ASM_Java4-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

# Mở cổng 8080 cho API
EXPOSE 8080

# Chạy Tomcat khi container khởi động
CMD ["catalina.sh", "run"]
