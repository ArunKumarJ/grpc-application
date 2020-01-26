
RUN mkdir -p \app \app\logs

COPY grpc-service-web\target\grpc-service-jar-with-dependencies.jar \app\app.jar