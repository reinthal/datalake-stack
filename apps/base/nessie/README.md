Setup the schema like this


```
docker run --rm ghcr.io/projectnessie/nessie-gc:0.99.0 create-sql-schema \
  --jdbc-url jdbc:postgresql://10.22.21.11:5432/nessie_gc \
  --jdbc-user postgres \
  --jdbc-password 'password123'
```
