# 📡 Task 4: Hands-On with Networking Commands

In modern DevOps, being comfortable with networking commands is crucial. These tools help you troubleshoot connectivity, monitor traffic, inspect APIs, and debug DNS — all from the terminal.

---

## 🎯 Objective

- Practice essential networking commands.
- Understand their syntax, purpose, and DevOps use cases.
- Create a reusable cheat sheet with examples and outputs.

---

## 🧰 Essential Commands + Examples

### 1. 🔄 ping – Check Connectivity

- Sends ICMP echo requests to test whether a remote host is reachable.

```
PING google.com (142.250.64.14): 56 data bytes
64 bytes from 142.250.64.14: icmp_seq=0 ttl=117 time=23.6 ms
```
---

### 2. 🛣️ traceroute / tracert – Trace Network Path
- Displays the path that packets take to reach a destination.

- traceroute github.com       # Linux/macOS
- tracert github.com          # Windows

- Use Case: Detect bottlenecks, DNS misrouting, or firewall drops.

Example Output:
```
1  192.168.0.1  (Router)
2  10.20.30.1   (ISP Gateway)
3  ...
8  140.82.114.3 (github.com)
```
--- 

### 3. 📈 netstat – Show Network Statistics
- Displays all active network connections and ports.
- netstat -tulnp        # Linux
- netstat -an           # macOS/Windows
-  Use Case: Check if NGINX or SSH is listening, or inspect open ports inside Docker.

Example Output:
```
Proto Recv-Q Send-Q Local Address  Foreign Address  State   PID/Program name
tcp        0      0 0.0.0.0:22     0.0.0.0:*        LISTEN  1023/sshd
```

- Alternative: Use ss for faster and more detailed output:
- ss -tulnp

### 4. 🌐 curl – Make HTTP Requests
- Transfers data from or to a server using HTTP, HTTPS, FTP, etc.
```
curl https://openai.com
curl -I https://example.com           # Show headers
curl -X POST -d 'name=devops' https://example.com/api
```
- Use Case: API testing, service health checks, and CI pipeline validation.

Example Output (Headers):
```
HTTP/1.1 200 OK
Content-Type: text/html
Date: Wed, 03 Jul 2025 12:34:56 GMT
```
---
### 5. 🌍 dig – DNS Query Tool
- Performs DNS lookups and shows detailed query responses.
```
dig openai.com
```
- Use Case: Check domain resolution, troubleshoot internal DNS in the cloud.

Example Output:
```
;; ANSWER SECTION:
openai.com.  300  IN  A  104.18.12.123
```
--- 
### 6. 🔎 nslookup – Name Resolution Lookup
- Simpler alternative to dig, and available on most OS by default.
```
nslookup github.com
```
- Example Output:
```
Server:  8.8.8.8
Address: 8.8.8.8#53

Non-authoritative answer:
Name:    github.com
Address: 140.82.114.3
```
--- 
## 🧠 DevOps Usage Table

| Command   | What It Does                     | DevOps Use Case                                   |
|-----------|---------------------------------|--------------------------------------------------|
| ping      | Check if host is reachable       | Verify uptime or basic connectivity               |
| traceroute| Trace the path to a host         | Locate bottlenecks, diagnose routing/firewall issues |
| netstat   | Show active connections & ports | Verify which services are listening (e.g., NGINX, SSH) |
| curl      | Perform HTTP requests            | Test APIs, health checks, CI/CD deployment validations |
| dig       | Perform DNS lookups              | Debug DNS issues, check service discovery records |
| nslookup  | Simple DNS query tool            | Quickly validate domain resolution                 |
