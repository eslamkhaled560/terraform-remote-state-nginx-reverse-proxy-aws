# Description

Employed custom Terraform modules to establish AWS infrastructure illustrated below.         

![image](https://github.com/eslamkhaled560/terraform-remote-state-nginx-reverse-proxy-aws/assets/54172897/b7f14708-0350-4ff9-9428-53a259aa8a2f)      

Automated configuration of Nginx instances as reverse proxies by employing Terraform local variables and a Bash script. Established an S3 remote backend for Terraform state files, offering a unifying focal point accessible to all teams, thereby streamlining collaborative efforts.       

--------------------------------------------
# Prequesets

- Terraform

--------------------------------------------
# Installation

- Clone repository
```
git clone https://github.com/eslamkhaled560/terraform-remote-state-nginx-reverse-proxy-aws.git
cd terraform-remote-state-nginx-reverse-proxy-aws
```

- Initialize
```
terraform init
```

- Preview terraform actions
```
terraform plan
```

- Set region as a custom tf environment variable before applying
```
export TF_VAR_region="your-custom-region"
```

- Apply configuration
```
terraform apply
```

- Enable the backend section in the [remote-backend.tf](https://github.com/eslamkhaled560/terraform-remote-state-nginx-reverse-proxy-aws/blob/main/remote-backend.tf) file (lines 33-41) to generate a remote backend for state files, optimizing their management and accessibility.

- Apply configuration
```
terraform apply
```

- Navigate to AWS Load Balancers and retrieve the DNS address of 'alb_nginx'. Access this address from your web browser to experience distributed request distribution to both Apache servers, showcasing the instance IPs for enhanced visibility.

- The state file can be located within the S3 service, while the lock ID is available in the DynamoDB service.

- Show resources and components from the current state
```
terraform state list
```

- Destroy resources
```
terraform destroy
```

---------------------------------------------------------------
