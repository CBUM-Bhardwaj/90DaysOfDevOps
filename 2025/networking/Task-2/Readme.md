# 🌐 Task 2: Protocols & Ports for DevOps

Understanding common protocols and their port numbers is critical in DevOps.  
They help you configure firewalls, load balancers, DNS, monitoring tools, CI/CD pipelines, and secure communication between services.

---

## 📊 Technical Table: Protocols, Ports & DevOps Use Cases

| 🔌 Protocol | 🔢 Port(s) | 📡 Transport Layer | ⚙️ DevOps Use Case                                                                 |
|------------|------------|--------------------|------------------------------------------------------------------------------------|
| **HTTP**   | 80         | TCP                | Expose web servers, health checks, internal API communication                     |
| **HTTPS**  | 443        | TCP                | Secure traffic for websites, APIs, and ingress controllers                         |
| **FTP**    | 21         | TCP                | Legacy file transfers to/from remote machines (rare in modern workflows)           |
| **SSH**    | 22         | TCP                | Secure shell access to servers, remote deployments, and Git over SSH              |
| **DNS**    | 53         | UDP / TCP          | Resolve domain names to IPs for infrastructure services, monitoring, containers    |
| **SMTP**   | 25 / 587   | TCP                | Send emails from CI/CD pipelines, alerts, or user notifications                    |
| **SNMP**   | 161        | UDP                | Monitor devices like routers, switches (used by monitoring tools like Zabbix)      |
| **TLS/SSL**| Varies     | Typically TCP      | Encryption layer for HTTPS, SMTP, IMAP, MQTT, and others                           |

> ℹ️ Note: UDP is used when speed matters (DNS, SNMP), TCP when reliability matters (SSH, HTTPS).

---

## 🌍 Real-World Explanation (Simple Terms)

| 🌐 Term     | 🧠 What It Is                        | 📱 Real-World Example                              |
|------------|--------------------------------------|----------------------------------------------------|
| **HTTP**   | Sends/receives web pages             | Browsing websites like `example.com`               |
| **HTTPS**  | Secure version of HTTP               | Logging into a bank or filling a form online       |
| **FTP**    | File sharing over a network          | Uploading website files to a web host              |
| **SSH**    | Secure remote access to computers    | Managing a cloud server from your laptop           |
| **DNS**    | Finds the IP of a domain name        | Turning `google.com` into `142.250.64.110`         |
| **SMTP**   | Sends email                          | Your app sending a "Welcome" email after signup    |
| **SNMP**   | Monitors devices on a network        | Data centers monitoring thousands of devices       |
| **TLS**    | Locks your data with encryption      | Secure traffic like `https://` or secure emails    |

---

## ✅ Task Summary

| 🔍 Item                               | 🧾 Description                                             |
|--------------------------------------|------------------------------------------------------------|
| 📚 Studied protocols & port numbers  | Covered most-used networking protocols in DevOps workflows |
| ⚙️ Mapped them to real use cases     | CI/CD, server access, DNS, SMTP, HTTPS APIs, monitoring    |
| 📝 Created reference tables           | Technical + human-friendly explanations                    |

