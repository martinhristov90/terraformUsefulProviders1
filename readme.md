## This reposistory is created with learning purposes for Terraform, focusing on Terraform data sources.

## Purpose :

- The repository provides simple guidelines how to use the Terraform data sources.

## How to install terraform : 

- The information about installing terraform can be found on the HashiCorp website 
[here](https://learn.hashicorp.com/terraform/getting-started/install.html)

## What is Terraform data source :

- Data source is a method for Terraform to fetch and use information that is computed by external for Terraform sources. Every data resource is defined using the `data` keyword.

## How to use this repository :

- In a directory of your choice, clone the github repository 
```
git clone https://github.com/martinhristov90/terraformUsefulProviders1.git
```

- Change into the directory
```
cd terraformUsefulProviders1
```

- Run `terraform init` to download needed provider(s).


## The code in `main.tf` and what does it do :

```
variable "animal" {}

data "template_file" "setup" {

  template = "${file("setup.sh")}"
  vars = {
    animal = "${var.animal}"
  }
}
output "template" {
    value = "${data.template_file.setup.rendered}"
}
```

- First, variable `animal` is declared with no value.
- The keyword `data` is used to define `data source`, the type is `template_file`, the name given is `setup` for this particular `data source`. `template_file` is used to execute various scripts with variables that are result of some Terraform operation, in this example the script `setup.sh` is going to be executed and the variable is going to be accessible within it. In order to access the `animal` variable inside `setup.sh`, referring to it should be done like this : `${animal}`.
- The final statement `"${data.template_file.setup.rendered}"` is going to show the output of `setup.sh`, it is defined as `output` block.

- Now you can run terraform apply (this repository makes not changes on any resources) . You are going to be prompted for the desired value of variable `animal` (it is declared empty, so Terraform needs value for it), the output should look like this : 
```
var.animal
  Enter a value: Lion

data.template_file.setup: Refreshing state...

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

Outputs:

template = #!/usr/bin/env bash

echo "Deploying Lion"
```


