# Oauth2 Proxy

## Generating a Cookie Secret

```bash
python -c 'import os,base64; print(base64.urlsafe_b64encode(os.urandom(32)).decode())'
```

## Generating the Client Secret

TODO

## Generating the sealed secret

```bash
cp .env.example.oauth2-proxy .oauth2-secret.env
```

Perform the above steps and put the secrets in `.oauth2-secret.env`. Then perform the below command.

```bash
kubectl create secret generic oauth2-proxy-secrets \
-n dagster --from-env-file=.oauth2-secret.env -o yaml \
--dry-run | tee oauth2-proxy-dagster-secrets.yaml | \
kubeseal --format=yaml --cert=../../../keys/pub-sealed-secrets.pem | \
tee oauth2-proxy-dagster-secrets-sealed.yaml
```

Commit changes and push using `deploy` script.
