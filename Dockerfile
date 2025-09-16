# docker build -t kazeemakinrinde/ngcloak:latest .

FROM quay.io/keycloak/keycloak:latest

# Set Keycloak to run in "quarkus" mode
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true
ENV KC_DB=postgres
ENV KC_DB_URL=jdbc:postgresql://dpg-another-a.oregon-postgres.render.com/something
ENV KC_DB_USERNAME=....
ENV KC_DB_PASSWORD=.....

# Add custom theme
COPY themes /opt/keycloak/themes

# Start Keycloak
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev", "--hostname-strict=false"]
