# How to implement dynamic storage accounts within terraform

## To create 3 storage accounts with custom named containers within each

Using the `storage.tfvar` configuration it is possible store an array of storage account/storage container combinations.

```json
storage_mapping = [
  { sa = "0", name = "earth" },
  { sa = "0", name = "venus" },
  { sa = "1", name = "mars" },
  { sa = "2", name = "jupiter" }
]
```

Where `sa` refers to the storage account index and `name` is the container name to be used.
The variable configuratio is controlled within the `vars.tf` and the defaults are controlled via `terraform.tfvars`.

This will create a unique 3 unique storage accounts with 4 containers

## Usage

Initialise the terraform configuration

```bash
    terraform init
```

Using the current configuration for the storage, genrerate a plan and apply

```bash
    terraform plan -var-file=storage.tfvars -out=my.plan
    terraform apply my.plan
```
