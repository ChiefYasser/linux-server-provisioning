# CentOS 9 Server Automation & Centralized Logging

##  Project Overview
This project automates the provisioning of CentOS 9 servers, establishes a centralized logging architecture using **Rsyslog**, and implements storage quotas using **XFS**. It simulates a production environment using Oracle VirtualBox.
<img width="1048" height="322" alt="525067660-df107b54-6127-4095-8f5d-d53f5e5d86e3" src="https://github.com/user-attachments/assets/198ec3a6-eec4-4ded-b615-649922e0189e" />


<img width="1314" height="548" alt="usecaseLinux" src="https://github.com/user-attachments/assets/83e8aa4a-0561-4f58-9808-b839513dbc48" />
## Technologies Used

*   **OS:** CentOS 9 Stream
*   **Scripting:** Bash
*   **Virtualization:** Oracle VirtualBox
*   **Logging:** Rsyslog (TCP/UDP Port 514)
*   **Storage:** XFS Quotas

##  Features
1.  **Automated Provisioning:** A Bash script that updates the OS, creates a SysAdmin user, and configures the Firewall.
2.  **Centralized Logs:** 
    *   **Server:** Receives logs and organizes them by hostname (`/var/log/remote/%HOSTNAME%`).
    *   **Client:** Forwards all system logs to the central server.
3.  **Disk Quotas:** Enforces a hard limit of 10MB on specific users to prevent storage saturation.


## Future implemtation : 
 Visualing the logs make the code better with automating everything making the user experience simplier and more friendly 
 Using Elk stack 
##  How to Run

### 1. Provisioning
Run the script as root on a fresh CentOS install:
```bash
chmod +x provision.sh
./provision.sh



