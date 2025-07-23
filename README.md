# 💼 Wisdom Shaibu – Cloud DevOps Resume

![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/wizzfi1/resume-deploy/deploy.yml?branch=main&label=build&logo=github&style=flat-square)
![GitHub last commit](https://img.shields.io/github/last-commit/wizzfi1/resume-deploy?style=flat-square)
![View Counter](https://img.shields.io/badge/dynamic/json?color=blue&label=Views&query=views&url=https://2k88saonj3.execute-api.eu-north-1.amazonaws.com&style=flat-square)
![Made with HTML](https://img.shields.io/badge/Built%20with-HTML%2FCSS-blue?style=flat-square&logo=html5)

![Visitor Count](https://img.shields.io/badge/dynamic/json?label=👁️%20Views&url=https://2k88saonj3.execute-api.eu-north-1.amazonaws.com&query=views&color=blue)

📍 **Live Website**  
🌐 [View Resume](https://d19tltegw3kn0f.cloudfront.net)

---

## 🚀 Project Overview

This project hosts my resume as a static site on AWS, enriched with DevOps automation and cloud services.

### 🌟 Features

- ✅ Static website hosted on **Amazon S3**
- ✅ Global content delivery via **CloudFront**
- ✅ HTTPS encryption (SSL/TLS)
- ✅ Live **visitor counter** using:
  - AWS Lambda (Node.js)
  - API Gateway
  - DynamoDB
- ✅ CI/CD Pipeline with **GitHub Actions**
- ✅ Dynamic visitor badge via **Shields.io**

---

## 🛠️ Tech Stack

| Component      | Service                     |
|----------------|-----------------------------|
| Website Hosting| Amazon S3 (Static Website)  |
| CDN            | AWS CloudFront              |
| Backend Logic  | AWS Lambda (Node.js 18.x)   |
| API Endpoint   | Amazon API Gateway          |
| Database       | Amazon DynamoDB             |
| CI/CD          | GitHub Actions              |
| Domain         | `*.cloudfront.net` (Free Tier) |

---

## 📂 Project Structure

```
├── resume-website/ # Contains index.html and assets
├── lambda/ # Lambda code (visitor-counter logic)
├── .github/workflows/ # GitHub Actions CI/CD pipeline
└── README.md # This file

```


---

## 🔄 Deployment

### Push to Deploy (CI/CD)

This project auto-deploys via GitHub Actions:

```yaml
on:
  push:
    branches:
      - main
```

It syncs your site to S3 and invalidates the CloudFront cache.

📈 Visitor Counter Flow

HTML page loads and calls your API:
https://2k88saonj3.execute-api.eu-north-1.amazonaws.com

Lambda updates view count in DynamoDB

Badge and page display the live count

🙌 Acknowledgments
Big shoutout to:

AWS Free Tier ☁️

Shields.io 🛡️

GitHub Actions 🚀