# 💼 Wisdom Shaibu – Cloud DevOps Resume

[![Deploy to S3](https://github.com/wizzfi1/AWS-Resume-project/actions/workflows/deploy.yml/badge.svg)](https://github.com/wizzfi1/AWS-Resume-project/actions/workflows/deploy.yml)
![AWS](https://img.shields.io/badge/AWS-S3%20%7C%20CloudFront-orange?logo=amazonaws&logoColor=white)
![IaC](https://img.shields.io/badge/Infrastructure-Terraform%20%7C%20Ansible-7B42BC)
![Views](https://img.shields.io/badge/Views-Dynamic-lightgrey?style=flat-square)

> 🚀 **Live Site:** [https://d19tltegw3kn0f.cloudfront.net](https://d19tltegw3kn0f.cloudfront.net)

---

## 📄 About

This is a **Cloud DevOps Portfolio Resume**, hosted entirely on AWS using modern Infrastructure as Code and CI/CD principles. It includes:

- 🖥️ Static site served via **Amazon S3 + CloudFront**
- ⚙️ Visitor counter powered by **Lambda + API Gateway + DynamoDB**
- 🔁 CI/CD with **GitHub Actions**
- 🌗 **Responsive UI** with **dark/light theme toggle**
- 📊 **Dynamic visit counter** rendered on the page

---

## 🛠 Tech Stack

| Area              | Tools & Services |
|------------------|------------------|
| ☁️ Cloud          | S3, CloudFront, Lambda, DynamoDB, API Gateway |
| 📦 Infrastructure | Terraform (IaC), Ansible (automation) |
| 🚀 CI/CD          | GitHub Actions |
| 👨‍💻 Frontend      | HTML5, CSS3, JavaScript |
| 🔐 Security       | IAM Roles, OAC, CORS |

---

## ⚙️ CI/CD Workflow Overview

GitHub Actions automatically deploys the `resume-website/` folder to S3 and invalidates the CloudFront cache on every push to the `main` branch.

<details>
<summary>CI/CD YAML Snippet</summary>

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

      - name: Configure AWS credentials (eu-north-1)
        uses: aws-actions/configure-aws-credentials@v3
        with:
          aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws-region: eu-north-1

      - name: Deploy static site to S3
        run: aws s3 sync ./resume-website s3://wizfi-bucket --delete

      - name: Invalidate CloudFront (global)
        uses: aws-actions/configure-aws-credentials@v3
        with:
          aws-region: us-east-1
          aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}

      - run: |
          aws cloudfront create-invalidation \
            --distribution-id EG6N3RCWLM0WT \
            --paths "/*"
```

📈 Visitor Count
Integrated AWS Lambda function increments and retrieves resume views in real-time from DynamoDB.

// Frontend snippet in index.html
fetch("https://2k88saonj3.execute-api.eu-north-1.amazonaws.com")
  .then(res => res.json())
  .then(data => {
    document.getElementById("visitor-count").innerText = `👁️ Views: ${data.views}`;
  });



Trigger Lambda Counter: Open devtools and refresh to see view count increase

🛡 License
MIT License © Wisdom Shaibu