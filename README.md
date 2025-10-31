# 🛒 DevOps Project – Automated CI/CD Pipeline for E-Commerce Platform (Jenkins, Docker & AWS)

## 🧩 Overview

This project simulates a real-world E-Commerce application deployment workflow, implementing a complete CI/CD pipeline that automates the journey of application code from
GitHub → Jenkins → Docker Hub → AWS EC2, with real-time deployment notifications via AWS SNS.

The pipeline is designed to address a common business challenge faced by online retail platforms — frequent feature updates, zero downtime, and rapid deployment cycles for new product listings, offers, and checkout improvements.
This system ensures every code change is automatically built, tested, containerized, deployed, and notified — just like modern e-commerce companies such as Flipkart or Amazon handle continuous delivery.

## 📌 Real-World Problem Statement

In a typical E-Commerce platform, development teams frequently push updates:
-New product catalogues
-Updated payment logic
-Promotional banners or offers
-Fixes for checkout or user authentication
-Manually deploying these updates to production causes:
-Downtime during releases
-Version mismatches between servers
-Higher risk of deployment failures

## 💡 Solution
This project builds an automated CI/CD pipeline that ensures every commit triggers:

-✅ Build and test of a Dockerized Node.js application
-✅ Push of the new image to Docker Hub
-✅ Automatic deployment to an AWS EC2 instance
-✅ Instant notifications of build success/failure via AWS SNS

With this setup, every new feature or bug fix pushed to GitHub can reach production servers within minutes, ensuring consistent and reliable user experience for the e-commerce platform.

## 🛠 Tools & Services

-Jenkins – CI/CD automation server (running on Windows host)
-Docker & Docker Hub – Containerization and image registry
-AWS EC2 – Hosting the production container
-AWS SNS – Real-time deployment notifications
-Git & GitHub – Source control and webhook trigger
-Node.js – Sample e-commerce app backend (order management mockup)

📂 Project Structure
```
├── Dockerfile            # Node.js app container definition
├── Jenkinsfile           # Declarative pipeline
├── app/                  # Application source code
│   ├── app.js
│   └── package.json
└── README.md             # Project documentation
```

## 🚀 Implementation Workflow

### 1️⃣ Setup Jenkins & GitHub

-Installed Jenkins on a Windows host and configured required plugins.
-Created a GitHub repository to hold the Node.js e-commerce app and Jenkinsfile.

📸 Screenshot 1: GitHub setup through VS Code
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/b99f53f7-6ac2-4898-a5f6-1a89dbf094ea" />

📸 Screenshot 2: Jenkins job configuration
<img width="1920" height="1080" alt="Screenshot (1076)" src="https://github.com/user-attachments/assets/70e6583f-c80b-476c-b15c-b95e7d7d2002" />

### 2️⃣ Configure AWS EC2

-Created an Ubuntu EC2 instance as the production environment.
-Configured inbound rules for SSH, HTTP/HTTPS, and app port 3000.
-Generated a .pem key pair for secure access by Jenkins.

📸 Screenshot 3: EC2 security group inbound rules
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/1a5e7ab3-5976-4f55-b39e-5b0e42bff7a8" />

### 3️⃣ Jenkins Pipeline Configuration

Key stages in Jenkinsfile:

-Checkout: Pull the latest code from GitHub
-Build Docker Image: docker build -t <image>:<build_number>
-Test: Run automated Node.js tests inside the container
-Push to DockerHub: Push the image for version tracking
-Deploy to EC2: Stop old container → pull & run latest image
-Notify via SNS: Send deployment success/failure message

📸 Screenshot 4: Jenkins pipeline execution view
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/b6b4a9e0-a81a-40d7-9a2f-118283e8ee33" />

### 4️⃣ Dockerization & Docker Hub Integration

-Used node:18-alpine for lightweight builds.
-Each commit triggers a new Docker image build with a unique tag.
-Jenkins pushes the image securely to Docker Hub.

📸 Screenshot 5: Successful Docker build
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/d2cb208e-c380-48db-b26c-ecda7454e7f5" />

📸 EC2 CLI interface (docker ps)
<img width="1897" height="321" alt="Screenshot 2025-09-27 172733" src="https://github.com/user-attachments/assets/f78efc44-2f2c-45be-b3e6-212315ab9b42" />

Public Repository:

docker.io/deepakjaiswal09/ci-cd-with-jenkins-aws

### 5️⃣ Secure Credential Management

All sensitive credentials were securely stored in Jenkins:
-Docker Hub: Username + Access Token → docker-hub-creds
-EC2 SSH Key: Stored as ec2-ssh-key
-AWS Keys: aws-access-key-id and aws-secret-access-key

📸 Screenshot 6: Jenkins credentials configuration
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/9b418668-c611-4c68-ac68-6e84de0d72db" />

### 6️⃣ AWS SNS Notifications

-Created an SNS topic jenkins-notify
-Subscribed an email endpoint and confirmed subscription
-Jenkins publishes build and deployment results automatically

📸 Screenshot 7: Example SNS email notification
<img width="1412" height="519" alt="image" src="https://github.com/user-attachments/assets/ebf124d7-563c-4950-9311-c6e6cfd1db7b" />

📸 SNS Configuration
<img width="1920" height="1080" alt="Screenshot (1075)" src="https://github.com/user-attachments/assets/2c913cab-1106-407b-8d1a-19a67a8ad30c" />

### 7️⃣ Final Deployment

Each GitHub commit automatically triggers:
-Build → Test → Push → Deploy
-EC2 updates with the new containerized app
-Email notification sent instantly via SNS

Deployed URL:
http://16.170.215.124:3000

📸 Screenshot 8: Running Node.js e-commerce app
<img width="1919" height="410" alt="image" src="https://github.com/user-attachments/assets/b1dc17be-5eab-43c0-9e5e-f2d0e39578a1" />

## 🎯 Outcome & Business Impact

✅ Fully automated CI/CD pipeline for an e-commerce platform
✅ Reduced manual deployment effort and human errors
✅ Near zero downtime during production updates
✅ Secure, reusable pipeline template for future microservices
✅ Real-time visibility into release status through AWS SNS

## 📊 Business Impact Summary

| Metric                          | Before Automation          | After CI/CD Implementation       |
| ------------------------------- | -------------------------- | -------------------------------- |
| **Deployment Time**             | ~30 minutes (manual setup) | ⏱️ ~2 minutes (fully automated)  |
| **Human Intervention**          | Required for every release | ⚙️ Completely automated pipeline |
| **Release Frequency**           | 1–2 updates/week           | 🚀 Multiple updates per day      |
| **Downtime During Deployments** | 5–10 minutes typical       | 🔒 Near Zero Downtime            |
| **Team Notifications**          | Manual tracking            | 📩 Automated via AWS SNS         |


This automation drastically improves development velocity, reliability, and customer experience — ensuring faster feature rollouts and fewer deployment-related errors.

## 📘 Key Learnings

-CI/CD pipeline design for real-world production workflows
-Secure secrets management using Jenkins credentials store
-Containerization with Docker and AWS integration
-Event-driven architecture via AWS SNS for alerting
-Cloud networking concepts (security groups, key pairs, IAM roles)

## 🤝 Contributing

Contributions to improve or extend the pipeline (for multi-service or multi-region deployment) are always welcome.



# 🚀 DevOps Project – Automated CI/CD Pipeline with Jenkins, Docker & AWS

## Overview
This project demonstrates a complete CI/CD pipeline that takes code from GitHub → Jenkins → Docker Hub → AWS EC2 and delivers real-time deployment notifications via AWS SNS.
The pipeline was implemented as part of a DevOps internship to gain hands-on experience with containerization, cloud deployment, and automated notifications.

## 📌 Objective

Build an end-to-end automated deployment system where every GitHub commit triggers:
-A Docker image build and test.
-Push of the new image to Docker Hub.
-Automatic deployment to an AWS EC2 instance.
-Email notification of build success or failure using AWS SNS.

## 🛠 Tools & Services

-Jenkins – CI/CD automation server (running on Windows host)
-Docker & Docker Hub – Containerization and image registry
-AWS EC2 – Hosting the production container
-AWS SNS – Email notifications
-Git & GitHub – Source control and webhook trigger
-Node.js – Sample application

## 📂 Project Structure

```bash
├── Dockerfile            # Node.js app container definition
├── Jenkinsfile           # Declarative pipeline
├── app/                  # Application source code
│   ├── app.js
│   └── package.json
└── README.md             # Project documentation
```
# 🚀 Steps Performed

## 1️. Setup Jenkins & GitHub

Installed Jenkins on a Windows host and configured required plugins.
Created a GitHub repository to hold the Node.js application and Jenkinsfile.

📸 Screenshot 1: Setting up the Github through vs code 

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/b99f53f7-6ac2-4898-a5f6-1a89dbf094ea" />


📸 Screenshot 2: Jenkins dashboard with job configuration

<img width="1920" height="1080" alt="Screenshot (1076)" src="https://github.com/user-attachments/assets/70e6583f-c80b-476c-b15c-b95e7d7d2002" />



## 2. Configure AWS EC2

Created an Ubuntu EC2 instance.
Added inbound rules for ports 22 (SSH), 80 (HTTP), 443 (HTTPS), and 3000 (App).
Generated a key pair (.pem) and stored it securely for Jenkins.

📸 Screenshot 3: EC2 security group inbound rules

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/1a5e7ab3-5976-4f55-b39e-5b0e42bff7a8" />



## 3. Jenkins Pipeline

Key stages defined in Jenkinsfile:
Checkout: Pull latest code from GitHub.
Build Docker Image: docker build -t <image>:<build_number> .
Test: Run npm test inside the container.
Push to DockerHub: Authenticate and push the image.
Deploy to EC2: SSH into EC2, stop old container, pull and run the new image.
Notify: Publish success/failure message to AWS SNS.

📸 Screenshot 4: Jenkins pipeline execution view

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/b6b4a9e0-a81a-40d7-9a2f-118283e8ee33" />



## 4. Dockerize the Application & Push to Docker Hub

Wrote a lightweight Dockerfile using the node:18-alpine base image.
Jenkins builds the image on every commit with a unique build tag.
After successful tests, Jenkins logs in to Docker Hub (credentials stored securely in Jenkins) and pushes the image to the public repository:

📸 Screenshot 2: Successful Docker build
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/d2cb208e-c380-48db-b26c-ecda7454e7f5" />

📸 docker ps : interface of ec2 cli :
<img width="1897" height="321" alt="Screenshot 2025-09-27 172733" src="https://github.com/user-attachments/assets/f78efc44-2f2c-45be-b3e6-212315ab9b42" />


### 🔑 Docker Hub Repository

Public images from this pipeline are available here:
```bash
docker.io/deepakjaiswal09/jenkins-demo
```

## 5️. Secure Credentials in Jenkins

Docker Hub: Username + Access Token saved as docker-hub-creds.
EC2 Key: SSH private key stored as ec2-ssh-key.
AWS Keys: aws-access-key-id and aws-secret-access-key stored as secrets.

## 📸 Screenshot 5: Jenkins credentials configuration

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/9b418668-c611-4c68-ac68-6e84de0d72db" />



## 6️. AWS SNS Notifications

Created an SNS Topic jenkins-notify.
Subscribed an email endpoint and confirmed subscription.
Jenkins pipeline uses the AWS CLI to publish build status.

📸 Screenshot 6: Example SNS email notification

<img width="1412" height="519" alt="image" src="https://github.com/user-attachments/assets/ebf124d7-563c-4950-9311-c6e6cfd1db7b" />

📸 Aws SNS Configuration :

<img width="1920" height="1080" alt="Screenshot (1075)" src="https://github.com/user-attachments/assets/2c913cab-1106-407b-8d1a-19a67a8ad30c" />




## 7️. Final Deployment

On each commit, Jenkins builds and deploys automatically.
The app is accessible at:
```bash
http://16.170.215.124/:3000
```
<img width="1919" height="410" alt="image" src="https://github.com/user-attachments/assets/b1dc17be-5eab-43c0-9e5e-f2d0e39578a1" />



## 🎯 Outcome

Fully automated pipeline from source to production.
Zero manual intervention required after code push.
Reusable pipeline template for future microservices.

---

## ✅ Acknowledgement

I successfully completed this DevOps internship project by implementing a production-grade CI/CD pipeline using Jenkins, Docker, GitHub, AWS EC2, and AWS SNS.
Key learnings include secure credential management, automated deployments, cloud networking (security groups, key pairs), and event-driven notifications.


## 🤝 Contributing

Contributions to improve or enhance this project are always welcome.




