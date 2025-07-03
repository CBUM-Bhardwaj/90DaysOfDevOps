## ☁️ 3. AWS EC2 & Security Groups

### 🎯 Goal  
Launch an instance and lock it down using Security Groups.

### 🛠️ Steps

1. Launch EC2 instance (Free Tier: `t2.micro` / `t3.micro`)
2. Create a **Security Group** with:
   - **Inbound:**
     - SSH (22) – only from *your IP*
     - HTTP (80), HTTPS (443) – open to *the internet*
   - **Outbound:**
     - HTTPS (443) – allow *all traffic*
3. Attach the SG to your EC2 instance.
4. Verify access:
   ```bash
   ssh ec2-user@<your-ec2-public-ip>
   curl http://<your-ec2-public-ip>
