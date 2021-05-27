## Solution-2

The code for this task can be found [here](https://github.com/JOSHUAJEBARAJ/terraform-learning/tree/main/task-2/solution)

## Pre-Task

First create the private and public key by typing the below command in the terminal 

```
ssh-keygen -m PEM -f do_key -N ""
```

Add the relevant permission to the created key using the below command 

```
chmod 600  do_key
```
Create the digital ocean api key If you don't have one, create it following this [tutorial](https://www.digitalocean.com/community/tutorials/how-to-create-a-digitalocean-space-and-api-key)

> Note : Make Sure you kept those keys safe and don't put share it online

Create the new file in the same directory  with the name `terraform.tfvars` 

Add the below content to the created file Replace *token-value* with the api-key that you have created in the previous step

```
do_token = "<token-value>"
```

## Task

Now type the below command in the terminal in order to create the resources using terraform

```
terraform init
```

```
terraform plan -out state.plan
```

```
terraform apply "state.plan"
```


Once everything is done you will see the **Ip address** of the loadbalancer as the terraform output. Navigate to the Ip address using the browser


On Hitting the IP address of the Loadbalancer
```
Welcome to <SERVER1-IP>
```

If you refresh again for sometimes you will see

```
Welcome to <SERVER2-IP>
```


## Post-task

Once everything is done make sure to tear down the Infrastructure that we have created during the task using the below command

```
terraform destroy -auto-approve
```

## References
1. https://www.digitalocean.com/community/tutorials/how-to-use-ansible-with-terraform-for-configuration-management
2. https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/loadbalancer