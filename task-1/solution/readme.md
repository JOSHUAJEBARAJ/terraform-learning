## Solution

First create the private and Public key using the below command 

```
ssh-keygen -m PEM -f do_key -N ""
```

Add the relevant permission

```
chmod 600  do_key
```
- Create the digital ocean api key If you dont have open create it following this [tutorial](https://www.digitalocean.com/community/tutorials/how-to-create-a-digitalocean-space-and-api-key)

Create the new file named`terraform.tfvars` 

Add the below content 

```
do_token = "<token-value>"
```
Now Type the below command 

```
terraform init
```

```
terraform plan -out state.plan
```

```
terraform apply "state.plan"
```

Once everything is done On hitting your ip You will see 

```
Welcome to <IP-ADDRESS>
```
Once everything is done make sure to tear down the infra using the below command

```
terraform destroy -auto-approve
```

## References
1. https://www.digitalocean.com/community/tutorials/how-to-use-ansible-with-terraform-for-configuration-management
2. https://www.digitalocean.com/community/tutorials/how-to-deploy-a-static-html-website-with-ansible-on-ubuntu-20-04-nginx
