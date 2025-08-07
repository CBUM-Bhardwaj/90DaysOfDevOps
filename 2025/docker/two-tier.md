# 🧱 2-Tier Application using Docker (Flask + MySQL)

A **2-tier application** typically consists of:  
- **Tier 1:** Backend application (Flask)  
- **Tier 2:** Database (MySQL)  
This guide will help you set up both using Docker. 

---
  
### ✅ Step 1: Clone the Demo Repository  
``` git clone https://github.com/LondheShubham153/two-tier-flask-app.git ```

Clone a sample Flask app that connects to MySQL:  

---

### ✅ Step 2: Move into the Project Directory  
```cd two-tier-flask-app```

🔎 This is the folder containing the app code and Dockerfile.

---

### ✅ Step 3: Build the Docker Image for the Flask App  
```docker build -t flaskapp:latest . ```

🔨 This will create a Docker image named `flaskapp` from the 
provided Dockerfile.  

---

### ✅ Step 4: Create a Custom Docker Network  
```docker network create twotier  ```

🔗 This allows containers to communicate with each other using container names (like "mysql").  

---

### ✅ Step 5: Run the MySQL Container (Tier 2 - Database)  
``` docker run --name mysql --network=twotier -e MYSQL_DATABASE=mydb -e MYSQL_ROOT_PASSWORD=admin -p 3306:3306 -d mysql:5.7 ```

🗃️ This starts a MySQL container with:  
- `mydb` as the database  
- `admin` as the root password  
- Exposes port 3306  
- Connected to the `twotier` network  

---

### ✅ Step 6: Run the Flask App Container (Tier 1 - Backend)  
``` docker run --name flaskapp --network=twotier -e MYSQL_HOST=mysql -e MYSQL_USER=root -e MYSQL_PASSWORD=admin -e MYSQL_DB=mydb -p 5000:5000 -d flaskapp:latest  ```

🚀 This runs the Flask app and passes the database connection details as environment variables. It connects to the `mysql` container via the `twotier` network.  

---

### 🎉 You're Done!  
Now, the Flask app should be up and running

---

### 📝 Extra Notes:  
- Make sure Docker is installed and running.  
- If a container fails to start, check logs using: ```docker logs <container_name> ```

- To check running containers: ```docker ps```  
- To stop and remove a container: ```docker stop <name> && docker rm <name>```
