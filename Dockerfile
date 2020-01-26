FROM alpine:3.9.5


RUN mkdir -p /app /app/logs

COPY grpc-service-web/target/grpc-service-jar-with-dependencies.jar /app/app.jar

RUN chgrp -R 0 /app \
  && chmod -R g+rwX /app
  
EXPOSE 8080 8081