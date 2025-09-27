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

## 1️⃣ Setup Jenkins & GitHub

Installed Jenkins on a Windows host and configured required plugins.
Created a GitHub repository to hold the Node.js application and Jenkinsfile.
📸 Screenshot 1: Jenkins dashboard with job configuration

