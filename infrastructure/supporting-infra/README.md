# how to create keycloak-secret-sealed.yaml

```bash 
echo "Input Keycloak Postgres Password:"
read PGPASSWORD
echo "Input Keycloak Admin Password:"
read ADMINPASSWORD
kubectl -n dagster create secret generic keycloak-secret -n keycloak \
--from-literal=keycloak-postgres-password="${PGPASSWORD}" \
--from-literal=keycloak-postgres-host='postgres.reinthal.me' \
--from-literal=keycloak-postgres-username='keycloak' \
--from-literal=keycloak-postgres-database='keycloak' \
--from-literal=keycloak-admin-password="${ADMINPASSWORD}" \
--dry-run=client \
-o yaml \
| tee keycloak-secret.yaml \
| kubeseal --format=yaml --cert=../../keys/pub-sealed-secrets.pem \
| tee keycloak-secret-sealed.yaml
unset PGPASSWORD
unset ADMINPASSWORD
```
