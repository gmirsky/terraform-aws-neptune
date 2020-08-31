# Create Neptune Database using Terraform

**Create a Neptune DB Instance** 

This collection of Terraform scripts will create a Neptune database, S3 bucket and IAM role.  The IAM role will be associated to the Neptune database to allow it to read the S3 bucket so it can import the data.

*Updated for Terraform 0.13*

### Code and data preparation

in `variables.tf` set the `vpc_name_tag` and `subnet_private_tag` to correspond with the tags of the VPC and subnets in your account. Update `data_directory` to point to the data files that will be uploaded into the S3 bucket to be later imported into the Neptune database.

in `data.tf` modify the filter stanza in the `aws_route_tables` data entry to allow the statement to properly select the routing table ids for your private subnets. 

```
 filter {
  name  = "tag:subnet_type"
  values = ["private"]
 }
```

Likewise, you can also add a a tag with a key of `subnet_type` and a value of `private` to perform the same task to the route tables you want to be selected.

Additionally, in `locals.tf` update the `tags` mapping to satisfy your requirements, the `s3_bucket_name` and any other variable you wish to change. 

### Terraform environment preparation

#### Workspaces

Check the workspace you are using. There should be a `dev`, `qa` and `prod`

```
terraform workspace list
```

##### Workspace creation

If there are no workspaces you can create them with the  `terraform workspace new <<<name of workspace>>>`  command. 

***Note**:* you must incorporate the project name into the workspace name and you must use a hyphen. For example if your project is `lmnoq` :

```
terraform workspace new lmnoq-dev

terraform workspace new  lmnoq-qa

terraform workspace new  lmnoq-prod
```

Failure to do so will throw an error during the plan phase. The error will be in the locals.tf file for the population of the tags, most notably, the Environment tag.

##### Workspace selection

If the terraform list command displays another workspace being active other than the one you want use the terraform select command

```
terraform workspace select lmnoq-dev
```

### Terraform deployment

To deploy and create the AWS assets

```
terraform init

terraform validate

terraform plan -out tfplan

terraform apply tfplan
```

### Terraform destroy

To remove the deployed assets

```
terraform destroy
```

### Security

This terraform script will create two IAM policies, one policy to allow IAM authentication access to the created Neptune database and one policy to deny all access to the created Neptune database. These policies can be attached to users or groups and should be used in conjunction with the built in policies `NeptuneReadOnlyAccess` and `NeptuneFullAccess` 

Neptune databases do not allow for fine grained access.

