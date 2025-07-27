# 💼 Wisdom Shaibu - Cloud DevOps Resume

[![Deploy to S3](https://github.com/wizzfi1/devops-resume/actions/workflows/deploy.yml/badge.svg)](https://github.com/wizzfi1/devops-resume/actions/workflows/deploy.yml)
![AWS](https://img.shields.io/badge/AWS-CloudFront%2FS3-orange?logo=amazonaws)
![Azure](https://img.shields.io/badge/Azure-DevOps-blue?logo=microsoftazure)
![IaC](https://img.shields.io/badge/IaC-Terraform%2FAnsible-%23774ABC)
![Views](https://img.shields.io/badge/Views-Dynamic-lightgrey?style=flat-square)

> 🚀 Live Resume: [https://d19tltegw3kn0f.cloudfront.net](https://d19tltegw3kn0f.cloudfront.net)

---

## 📄 About

This is a **Cloud DevOps Resume** site built using HTML/CSS, fully deployed on **AWS S3 + CloudFront**, and backed by a live **Lambda + DynamoDB** visitor counter API.

It includes:
- Responsive mobile UI
- Dark/light theme toggle 🌗
- CI/CD pipeline with GitHub Actions
- Dynamic visitor count displayed on the page 👁️

---

## 📦 Tech Stack

| Area              | Tools Used |
|-------------------|------------|
| ☁️ Cloud Platform | AWS (S3, CloudFront, Lambda, DynamoDB, API Gateway) |
| 🚀 CI/CD          | GitHub Actions |
| 📦 Infrastructure | Terraform, Ansible |
| 👨‍💻 Frontend      | HTML5, CSS3, JavaScript |
| 🔐 Auth/Security  | IAM Roles, CORS, CloudFront OAC |

---

## ⚙️ CI/CD Workflow

Automatically deploys `resume-website/` to S3 and invalidates CloudFront cache on push to `main`.

```yaml
name: Deploy Resume to S3

on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: aws-actions/configure-aws-credentials@v3
        with:
          aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws-region: eu-north-1
      - run: |
          aws s3 sync ./resume-website s3://wizfi-bucket --delete
      - run: |
          aws cloudfront create-invalidation \
            --distribution-id EG6N3RCWLM0WT \
            --paths "/*"

📈 Visitor Count
This project uses AWS Lambda + DynamoDB to dynamically update and show visit count.

// Fetch view count from API
fetch("https://2k88saonj3.execute-api.eu-north-1.amazonaws.com")
  .then(res => res.json())
  .then(data => {
    document.getElementById("visitor-count").innerText = `👁️ Views: ${data.views}`;
  });


🛡️ License
MIT License © Wisdom Shaibu

