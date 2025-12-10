# CentOS 9 Server Automation & Centralized Logging

## 📋 Project Overview
This project automates the provisioning of CentOS 9 servers, establishes a centralized logging architecture using **Rsyslog**, and implements storage quotas using **XFS**. It simulates a production environment using Oracle VirtualBox.

## 🏗️ Architecture
![Architecture Diagram](docs/architecture.png)
*Use your PlantUML image here*

## 🛠️ Technologies Used
*   **OS:** CentOS 9 Stream
*   **Scripting:** Bash
*   **Virtualization:** Oracle VirtualBox
*   **Logging:** Rsyslog (TCP/UDP Port 514)
*   **Storage:** XFS Quotas

## 🚀 Features
1.  **Automated Provisioning:** A Bash script that updates the OS, creates a SysAdmin user, and configures the Firewall.
2.  **Centralized Logs:** 
    *   **Server:** Receives logs and organizes them by hostname (`/var/log/remote/%HOSTNAME%`).
    *   **Client:** Forwards all system logs to the central server.
3.  **Disk Quotas:** Enforces a hard limit of 10MB on specific users to prevent storage saturation.

## 💻 How to Run

### 1. Provisioning
Run the script as root on a fresh CentOS install:
```bash
chmod +x provision.sh
./provision.sh

Schema for better understading :