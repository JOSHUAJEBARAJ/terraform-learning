## Solution-3

The code for this task can be found [here]

## Pre-Task

First create the private and public key by typing the below command in the terminal 

```
ssh-keygen -m PEM -f do_key -N ""
```

Add the relevant permission to the created key using the below command 

```
chmod 600  do_key
```
- Create the digital ocean api key If you don't have one, create it following this [tutorial](https://www.digitalocean.com/community/tutorials/how-to-create-a-digitalocean-space-and-api-key)

> Note : Make Sure you kept those keys safe and don't put share it online

Create the new file in the same directory  with the name `terraform.tfvars` 

Add the below content to the created file Replace *token-value* with the api-key that you have created in the previous step

```
do_token = "<token-value>"
```

Now Install the `ansible-role` by typing  the below command in the terminal

```
ansible-galaxy install joshuajebaraj.ansible_role_gitea
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


Once everything is done you will see the ip address of the droplet as the terraform output. Navigate to the ip address using the browser

On hitting the ip-address you will see the `Gitea` Initial Welcome Page

## Post-task

Once everything is done make sure to tear down the **Infrastructure** that we have created during the task using the below command

```
terraform destroy -auto-approve
```

## References
1. https://www.digitalocean.com/community/tutorials/how-to-use-ansible-with-terraform-for-configuration-management
2. https://galaxy.ansible.com/joshuajebaraj/ansible_role_gitea