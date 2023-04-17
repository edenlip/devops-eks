# devops-eks

This repo should be used to manage an EKS infrastructure.

## Directory structure
<root dir>/ </br>
├── base/</br>
│   │   ├── versions.tf</br>
│   │   ├── outputs.tf</br>
│   │   ├── data.tf</br>
│   │   ├── variables.tf</br>
│   │   ├── networking.tf</br>
│   │   ├── eks.tf</br>
│   │   └── ....</br>
│   ├── gke/</br>
│   │   ├── versions.tf</br>
│   │   ├── outputs.tf</br>
│   │   ├── data.tf</br>
│   │   ├── variables.tf</br>
│   │   ├── cockpit.tf</br>
│   │   ├── mongo.tf</br>
│   │   └── ....</br>

There are two different workspaces as per the best practice for EKS, one for base infra and one for apps inside EKS.

### base workspace will create new VPC and an EKS cluster
### EKS workspace will create:
cockpit deployment in namespace cockpit that using mongo db as database. </br>
mongo is deployed in mongo namespace.
you can get the lb endpoint via the <b ><load_balancer_hostname> </b> output.
for autoscaling im using KEDA that id deployed in keda namespace.