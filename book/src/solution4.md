## Solution-4

The code for this task can be found [here]

## Pre-Task


Setup the Terraform and GCP following this [Guide](https://cloud.google.com/community/tutorials/getting-started-on-gcp-with-terraform)


Create the new file in the same directory  with the name `terraform.tfvars` 

Add the below content to the created file Replace *project-name* with  your google cloud project name 

```
region = "us-central1"
project = "<project-name>"
zone = "us-central1-a"
```



## Task

Now type the below command in the terminal in order to create the resources terraform

```
terraform init
```

```
terraform plan -out state.plan
```

```
terraform apply "state.plan"
```


Once everything is done you will see the ip address of the compute instance as the terraform output. Navigate to the ip address using the browser

On hitting the ip-address you will see the `Nginx`  Welcome Page

## Post-task

Once everything is done make sure to tear down the Infrastructure that we have created during the task using the below command

```
terraform destroy -auto-approve
```

## References
1. https://www.digitalocean.com/community/tutorials/how-to-use-ansible-with-terraform-for-configuration-management
2. https://galaxy.ansible.com/joshuajebaraj/ansible_role_gitea