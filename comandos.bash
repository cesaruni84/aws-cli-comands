
### Comandos AWS CLI
aws configure

## Listar instancias ec2
aws ec2 describe-instances --region us-west-1

## Listar instancias ec2 con formato tabla
aws ec2 describe-instances --filter Name=tag-key,Values=Name --query 'Reservations[*].Instances[*].{Instance:InstanceId,State:State.Name,AZ:Placement.AvailabilityZone,Name:Tags[?Key==`Name`]|[0].Value}' --output table

## Listar volumenes ec2 en formato tabla
aws ec2 describe-volumes --query 'Volumes[*].{ID:VolumeId,InstanceId:Attachments[0].InstanceId,AZ:AvailabilityZone,Size:Size}' --output table

### EC2
# Listar KeyPair's
aws ec2 describe-key-pairs

# Crear KeyPair
aws ec2 create-key-pair --key-name MyKeyPair --query 'KeyMaterial' --output text > MyKeyPair.pem

# Consultar KeyPair
aws ec2 describe-key-pairs --key-name MyKeyPair

# Eliminar KeyPair
aws ec2 delete-key-pair --key-name MyKeyPair

## Security Groups
# List Security Groups
aws ec2 describe-security-groups

aws ec2 describe-security-groups --query 'SecurityGroups[*].{ID:GroupId,Name:GroupName,Description:Description}' --output table
aws ec2 describe-security-groups --query 'SecurityGroups[*].{ID:GroupId,Name:GroupName,Description:Description}' --output json


# Create Security Group
aws ec2 create-security-group --group-name my-sg --description "My security group" --vpc-id vpc-83468cf9


# Create Security Group with tags (Name and Environment)
aws ec2 create-security-group --group-name my-sg-v2 --description "My security group v2" --vpc-id vpc-83468cf9 --tag-specifications 'ResourceType=security-group,Tags=[{Key=Name,Value=HTTP_TEST},{Key=Environment,Value=Test}]'


# Describe Security Group
aws ec2 describe-security-groups --group-ids sg-08b82a8ac604fbb5a

# Authorize Security Group Ingress
aws ec2 authorize-security-group-ingress --group-id sg-08b82a8ac604fbb5a --protocol tcp --port 3389 --cidr 38.43.130.181/32

# Delete Security Group
aws ec2 delete-security-group --group-id sg-08b82a8ac604fbb5a