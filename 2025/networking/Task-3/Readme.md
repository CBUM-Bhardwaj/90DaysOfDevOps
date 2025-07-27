# ☁️ Task 3: AWS EC2 & Security Groups

Welcome to **Task 3** of the #90DaysOfDevOps journey!  
In this task, we’ll go hands-on with **AWS EC2** and learn how to properly set up and secure a virtual machine using **Security Groups**.

---

## 🎯 Goal

- Learn how to launch an EC2 instance (Free Tier).
- Understand and configure Security Groups (AWS firewall).
- Connect to your instance using SSH and verify with `curl`.

---

## 🚀 Step-by-Step: Launch EC2 Instance

### 🔹 1. Sign In to AWS

- Go to: [AWS Console](https://console.aws.amazon.com/)
- Ensure you’re in a **Free Tier–eligible region** (e.g., `us-east-1`, `us-west-2`)

---

### 🔹 2. Launch an EC2 Instance

**From the AWS Console:**

1. Navigate to `EC2` → Click **Launch Instance**
2. **Name your instance**: e.g., `devops-ec2`
3. **Select Amazon Machine Image (AMI)**:
   - ✅ Choose `Amazon Linux 2` (Free Tier eligible)
4. **Instance Type**:
   - ✅ `t2.micro` or `t3.micro` (Free Tier)
5. **Key Pair (login)**:
   - Create or select an existing key pair (Download `.pem` file!)
6. **Network settings**:
   - Create a **new Security Group** (details below 👇)
7. **Storage**:
   - 8 GB (default) is fine for testing
8. Click **Launch Instance**

---

## 🛡️ Step-by-Step: Configure Security Group (Firewall Rules)

### What is a Security Group?

> A Security Group acts as a **virtual firewall** that controls inbound and outbound traffic to your EC2 instance.

---

### 🔹 Inbound Rules

| Type        | Protocol | Port Range | Source      | Purpose                             |
|-------------|----------|------------|-------------|-------------------------------------|
| SSH         | TCP      | 22         | Your IP     | To connect via SSH (private access) |
| HTTP        | TCP      | 80         | 0.0.0.0/0   | To serve web traffic (public)       |
| HTTPS       | TCP      | 443        | 0.0.0.0/0   | Secure web access                   |

> 🛑 **Important:** Never expose SSH (port 22) to the world (0.0.0.0/0)! Use "My IP".

---

### 🔹 Outbound Rules

| Type      | Protocol | Port Range | Destination | Purpose                  |
|-----------|----------|------------|-------------|--------------------------|
| All traffic | All     | All        | 0.0.0.0/0   | Default — allow all out |

---

## 🔗 Connect to Your EC2 Instance

After your instance is running:

1. Go to **Instances** in EC2 Dashboard.
2. Copy the **Public IPv4 address**.
3. Open terminal and run:

```bash
chmod 400 your-key.pem      # Protect your private key
ssh ec2-user@<your-ip> -i your-key.pem
```

## 🔍 Verify Access with `curl`

After SSH-ing into your EC2 instance, install a basic web server and test connectivity.

### 🖥️ Inside your EC2 terminal, run:

```bash
# Install Apache web server
sudo yum install -y httpd

# Start the web server
sudo systemctl start httpd

# Enable it on boot
sudo systemctl enable httpd

# Create a basic web page
echo "Hello from EC2!" | sudo tee /var/www/html/index.html
```


## 🌐 Then test from your browser:
```bash
http://<your-ec2-public-ip>
```
