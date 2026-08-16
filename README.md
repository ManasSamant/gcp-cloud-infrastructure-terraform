# GCP Cloud Infrastructure with Terraform

This repository contains the implementation and documentation for **Cloud Computing Assignment 5**.

The project demonstrates how a modular cloud infrastructure can be designed and provisioned on **Google Cloud Platform (GCP)** using **Terraform Infrastructure as Code (IaC)**.

The infrastructure includes networking, IAM, storage, serverless compute, Cloud Run, Cloud Functions, and a frontend application.

## Overview

The objective of this assignment was to implement a modular cloud infrastructure using Terraform and Google Cloud services.

The infrastructure is divided into reusable Terraform modules for different cloud components, making the configuration easier to maintain, understand, and extend.

The project includes:

* Google Cloud networking
* IAM and service accounts
* Cloud Storage
* Google Cloud Functions
* Google Cloud Run
* VPC networking and connectors
* Artifact Registry
* Firestore
* Cloud Build
* Frontend hosting
* Terraform Infrastructure as Code

## Architecture

The overall infrastructure can be represented as:

```text
                         Google Cloud Platform
                                  |
                 +----------------+----------------+
                 |                |                |
                 v                v                v
             Networking          IAM           Storage
                 |                |                |
                 |                |                |
                 +--------+-------+----------------+
                          |
                          v
                    Compute Services
                          |
                 +--------+---------+
                 |                  |
                 v                  v
          Cloud Functions       Cloud Run
                 |                  |
                 +--------+---------+
                          |
                          v
                     Frontend
```

## Technologies Used

* Google Cloud Platform (GCP)
* Terraform
* Google Cloud Run
* Google Cloud Functions
* Google Cloud Storage
* Google Cloud VPC
* VPC Access Connector
* IAM
* Artifact Registry
* Cloud Build
* Firestore
* HTML
* Python

## Terraform Architecture

The Terraform configuration follows a modular architecture.

```text
terraform/
│
├── main.tf
├── providers.tf
├── variables.tf
├── outputs.tf
│
└── modules/
    ├── compute/
    ├── iam/
    ├── networking/
    └── storage/
```

Each module is responsible for a specific part of the cloud infrastructure.

### Networking Module

The networking module is responsible for creating and configuring the network infrastructure required by the application.

This includes the VPC and VPC Access Connector used by the serverless components.

### IAM Module

The IAM module manages the service accounts required by the cloud services.

Separate service accounts are used for the Cloud Function and Cloud Run components.

### Storage Module

The storage module provisions Google Cloud Storage resources used by the infrastructure.

It also contains frontend resources used for hosting the application interface.

### Compute Module

The compute module manages the serverless compute components, including:

* Cloud Functions
* Cloud Run
* Frontend resources
* Serverless configuration

The Cloud Function contains a Python implementation with its required dependencies.

## Enabled Google Cloud APIs

The Terraform configuration enables the APIs required by the project, including:

* Compute Engine API
* Cloud Run API
* Cloud Functions API
* Cloud Build API
* Firestore API
* VPC Access API
* Artifact Registry API

This allows the required Google Cloud services to be provisioned through Terraform.

## Infrastructure Outputs

The Terraform configuration provides outputs for important infrastructure resources, including:

* VPC name
* VPC connector ID
* Cloud Function service account
* Cloud Run service account
* Terraform state bucket
* Frontend bucket
* Frontend URL
* Cloud Function URL

These outputs make it easier to retrieve important resource information after Terraform deployment.

## Serverless Application

The project includes a Python-based Cloud Function and Cloud Run integration.

The Cloud Function source code is located at:

```text
modules/compute/function/main.py
```

Its Python dependencies are defined in:

```text
modules/compute/function/requirements.txt
```

## Frontend

Frontend resources are included as HTML files within the compute and storage modules.

```text
modules/compute/frontend/index.html
modules/storage/frontend/index.html
```

These files provide the frontend component associated with the cloud application.

## Deployment

The infrastructure can be managed using standard Terraform commands.

Initialize Terraform:

```bash
terraform init
```

Validate the configuration:

```bash
terraform validate
```

Review the planned infrastructure changes:

```bash
terraform plan
```

Apply the infrastructure:

```bash
terraform apply
```

After deployment, Terraform outputs provide information such as the frontend URL and Cloud Function URL.

## Security and Configuration

Project-specific configuration and generated Terraform files are intentionally excluded from the repository.

The following files and directories should not be committed:

```text
.terraform/
terraform.tfstate
terraform.tfstate.backup
terraform.tfvars
```

These files may contain local Terraform state, provider data, project-specific configuration, or sensitive information.

A `.gitignore` file is included to prevent accidentally committing generated Terraform files.

## Documentation

The `Documentation` directory contains the academic documentation associated with the assignment:

* Assignment 5 submission
* Assignment 5 reflection
* Cover letter

## Learning Outcomes

This assignment provided practical experience with Infrastructure as Code and Google Cloud Platform.

The main learning outcomes include:

* Understanding Infrastructure as Code using Terraform.
* Designing modular Terraform configurations.
* Creating reusable Terraform modules.
* Provisioning Google Cloud infrastructure programmatically.
* Configuring VPC networking.
* Managing IAM service accounts.
* Working with Google Cloud Storage.
* Deploying serverless applications.
* Understanding Cloud Functions and Cloud Run.
* Managing cloud infrastructure through Terraform outputs.
* Understanding dependencies between cloud services.
* Applying cloud computing concepts to a practical infrastructure project.

## Academic Context

**Course:** Cloud Computing
**Assignment:** Assignment 5
**Student:** Manas Samant
**Matriculation Number:** 227129
**Programme:** M.Sc. Software Engineering
**Institution:** Hochschule Heilbronn

## Repository Structure

```text
gcp-cloud-infrastructure-terraform/
│
├── README.md
│
├── terraform/
│   ├── main.tf
│   ├── providers.tf
│   ├── variables.tf
│   ├── outputs.tf
│   │
│   └── modules/
│       ├── compute/
│       ├── iam/
│       ├── networking/
│       └── storage/
│
└── Documentation/
    ├── CC_Assignment_5_Reflection_227129.pdf
    ├── CC_Assignment_5_SS.pdf
    └── Cover_letter_Manas_Samant_227129.docx
```

## Author

**Manas Samant**

M.Sc. Software Engineering
Hochschule Heilbronn

---

## License

This repository contains academic coursework and is intended primarily for educational purposes.

