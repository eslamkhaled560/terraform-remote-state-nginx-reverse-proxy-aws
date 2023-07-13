# Terraform Lab 3 - Nginx Reverse Proxy with Remote State Backend        
# Automated Nginx Configuration

**Presented to:**    
_Sabreen Salama_    

**Presented by:**   
_Islam Khaled_    

13 July 2023

-----------------------------------------
## Dev Workspace 

![1](https://github.com/eslamkhaled560/terraform-remote-state-nginx-reverse-proxy-aws/assets/54172897/e45056f4-e9ff-4a2a-b2cf-78ae2c5d19ab)

-----------------------------------------
## Automated Nginx Configuration!

- Private load balancer DNS

![2](https://github.com/eslamkhaled560/terraform-remote-state-nginx-reverse-proxy-aws/assets/54172897/f14f157c-b4f0-4f10-b1a5-ffde1bdd7f23)

- Nginx Instances user data, providing private load balancer DNS as a variable ```proxy_pass_url```. Notice ```depends_on```.

![3](https://github.com/eslamkhaled560/terraform-remote-state-nginx-reverse-proxy-aws/assets/54172897/891f1cc4-07b5-475b-a90c-83af255e077b)
![4](https://github.com/eslamkhaled560/terraform-remote-state-nginx-reverse-proxy-aws/assets/54172897/ec2e771c-143b-4049-a451-016cd0c74123)

- Nginx configuration bash script, with ```proxy_pass_url``` passed automatically.

![5](https://github.com/eslamkhaled560/terraform-remote-state-nginx-reverse-proxy-aws/assets/54172897/5aec477c-aac3-4202-819c-152ec9544c97)

-----------------------------------------
## Public Load Balancer DNS Traffic

![6](https://github.com/eslamkhaled560/terraform-remote-state-nginx-reverse-proxy-aws/assets/54172897/8158de28-a916-474c-be55-eca92b8c7ba6)
![7](https://github.com/eslamkhaled560/terraform-remote-state-nginx-reverse-proxy-aws/assets/54172897/d22f0d4d-4bc7-4016-8207-20bde2a04103)

-----------------------------------------
## Remote Backend

![8](https://github.com/eslamkhaled560/terraform-remote-state-nginx-reverse-proxy-aws/assets/54172897/1f36f8aa-bda9-40e9-9a33-17239e0dac6b)

-----------------------------------------
