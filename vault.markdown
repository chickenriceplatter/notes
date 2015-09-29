vault (https://vaultproject.io/)
===

setting up vault in production, using filesystem as backend
---

1. create configuration.hcl and populate with the following:

  ```
  backend "file" {
    path = "/path/to/storing/vault/data"
  }

  listener "tcp" {
    address = "127.0.0.1:8200"
    tls_disable = 1
  }
  ```

2. in the same directory as your configuration.hcl, launch server

  ```bash
  $ vault server -config=configuration.hcl
  ```

3. copy down the 5 keys and 1 token that you see

4. set the VAULT_ADDR environment variable

  ```bash
  $ export VAULT_ADDR='http://127.0.0.1:8200'
  ```

5. unseal the vault, do it 3 times using an unique each time

  ```bash
  $ vault unseal
  ```

6. authenticate user, use the token that you had copied

  ```bash
  $ vault auth
  ```

7. you should now be able to use vault

  ```bash
  $ vault mounts
  ```
