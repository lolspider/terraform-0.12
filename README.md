# Terraform 0.12.6

## Use git-secret to store secrets in repo

[git-secret.io](https://git-secret.io/)

### Setting up git-secret in a repository

### Adding someone to a repository using git-secret

1. Get their gpg public-key. You won’t need their secret key.

2. Import this key into your gpg setup (in ~/.gnupg or similar) by running gpg --import KEY_NAME.txt

3. Now add this person to your secrets repo by running git secret tell persons@email.id (this will be the email address associated with the public key)

4. The newly added user cannot yet read the encrypted files. Now, re-encrypt the files using git secret reveal; git secret hide -d, and then commit and push the newly encrypted files. (The -d options deletes the unencrypted file after re-encrypting it). Now the newly added user be able to decrypt the files in the repo using git-secret.


## Vault secrets management

### Add a secret

``` 
1. Add module
2. Add vars
3. terraform init
4. terraform plan && apply
```

### Remove a secret

```
1. Remove module
2. terraform state list
3. terraform state rm `state_name`
```