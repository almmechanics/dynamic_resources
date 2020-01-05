# How to implement dynamic storage accounts within terraform

## To create 3 storage accounts with custom named containers within each

Using the `storage.tfvar` configuration it is possible store a map of storage account/storage container combinations.

```json
storage_mapping = {
  "earth" = "0"
  "venus" = "0"
  "mars" = "1"
  "jupiter" ="2"
}
```

Where the `key` refers to the container name, and `value` is the storage account to be used.
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

## Expected output

The tests show how the `resource_group_name` and `storage_containers` outputs can be read.

```json

resource_group_name = rg_test_demo01-
storage_containers = [
  [
    "https://taoqhuwrxj7b000.blob.core.windows.net/earth",
    "https://taoqhuwrxj7b002.blob.core.windows.net/jupiter",
    "https://taoqhuwrxj7b001.blob.core.windows.net/mars",
    "https://taoqhuwrxj7b002.blob.core.windows.net/pluto",
    "https://taoqhuwrxj7b000.blob.core.windows.net/venus",
  ],
]
```
