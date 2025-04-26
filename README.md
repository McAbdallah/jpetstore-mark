## 📌 Project Overview

### 🎯 Objective
The JPetStore CI/CD project implements a fully automated CI/CD pipeline for the JPetStore Java web application. The pipeline builds, tests, containerizes, and deploys the app locally on a Jenkins VM using Docker and Ansible.

### 📦 Scope
- **Application**: JPetStore (Maven-based Java web app)
- **CI/CD Stack**:
  - **Jenkins** – Pipeline orchestration
  - **Maven** – Build and test
  - **Docker** – Containerization
  - **Ansible** – Deployment automation
  - **Docker Hub** – Image registry
- **Deployment**: Local (http://localhost:8081/jpetstore)
- **Exclusions**: No Prometheus, AWS, or Terraform
- **Branch**: `master`

---

## 🚀 Key Deliverables
- Jenkins pipeline to:
  - Clone repo
  - Build & test with Maven
  - Build Docker image & push to Docker Hub
  - Deploy using Ansible
- Robust `deploy.yml` playbook
- Clean, documented repo structure

---

## 🔧 Technical Implementation

### 📁 Repository Structure
```
jpetstore-cicd/
├── src/                    # Application source code
├── pom.xml                 # Maven configuration
├── mvnw, .mvn/             # Maven wrapper
├── Dockerfile              # Docker build definition
├── Jenkinsfile             # CI/CD pipeline script
├── ansible/
│   ├── inventory           # Ansible inventory
│   └── deploy.yml          # Ansible playbook
```

### 🧩 Jenkinsfile Overview
1. Clone `master` branch
2. Build app with `mvn clean package`
3. Run unit tests
4. Build and tag Docker image: `markemadd/jpetstore:<build_number>`
5. Push to Docker Hub
6. Deploy via Ansible:
   ```bash
   ansible-playbook ansible/deploy.yml -i ansible/inventory \
     -e docker_image=markemadd/jpetstore:<build_number>
   ```

## ✅ Outcomes

- 🔄 Pipeline runs end-to-end from build to deployment
- 🌐 App accessible at [http://localhost:8081/jpetstore](http://localhost:8080/jpetstore)
- 🐳 Docker container verification:
  ```bash
  sudo docker ps
  curl http://localhost:8080/jpetstore
  ```

---

## 📚 Lessons Learned

- Robust playbooks reduce debugging effort
- Dependency resolution is key for CI/CD reliability
- Jenkins + Docker + Ansible works well for local pipelines
- Debugging with `systemctl`, `journalctl`, and Ansible tasks is invaluable

---

## 🔮 Future Improvements

- Add monitoring (Prometheus)
- Add cloud support (AWS + Terraform)
- Add integration testing to Jenkins pipeline

---

## 🏁 Conclusion

This project demonstrates a professional-grade local CI/CD pipeline using Jenkins, Docker, and Ansible. It builds, tests, deploys, and verifies a Java web app — all automated and resilient. A practical showcase of DevOps principles in action.

---


## 🖥️ Demo Instructions

1. Trigger a build in Jenkins (`javaapp` job)
2. Show Docker container:
   ```bash
   docker ps
   ```
3. Visit the app at: [http://localhost:8081/jpetstore](http://localhost:8080/jpetstore)
4. Show repository structure on GitHub

---

**Thank you!**
