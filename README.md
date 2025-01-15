# Demo Project: GitHub Action Matrix Deployment

This project demonstrates the deployment of an AWS CDK (Cloud Development Kit) application using a GitHub Action with a matrix configuration to support multiple AWS accounts simultaneously.

## Key Features

1. CDK Integration:
    The project leverages AWS CDK to define infrastructure as code (IaC), making deployments repeatable and version-controlled.
2. Matrix Setup:
    A matrix strategy is used in the GitHub Action, enabling parallel deployment across two AWS accounts.
3.  Workflow Configuration:
    The deployment workflow is defined in .github/workflows/deploy-cdk.yml. It includes the matrix setup and all necessary steps for deploying the CDK application to the target accounts.

This project serves as a practical example for multi-account deployment strategies using modern CI/CD tools and AWS services.