<h1 align="center">Inception - Docker Infrastructure Project</h1>
<p align="center">A project to build a secure, scalable web infrastructure using Docker, by creating custom images from scratch and orchestrating multiple containers with Docker Compose.</p>

<hr/>

<h2>📌 Table of Contents</h2>
<ul>
  <li><a href="#about">About</a></li>
  <li><a href="#features">Features</a></li>
  <li><a href="#installation">Installation</a></li>
  <li><a href="#usage">Usage</a></li>
  <li><a href="#screenshots">Screenshots</a></li>
</ul>

<hr/>

<h2 id="about">📖 About</h2>
<p>
This project focused on building a secure, scalable web infrastructure using Docker. The goal is to create custom Docker images from scratch and orchestrate multiple containers (Nginx, WordPress, MariaDB) with Docker Compose, ensuring data persistence, network isolation, and automated deployment.
</p>

<h2 id="features">📦 Features</h2>
<ul>
  <li>Custom Dockerfiles for each service (Nginx, WordPress, MariaDB)</li>
  <li>Secure configuration with environment variables and Docker secrets</li>
  <li>Data persistence using Docker volumes</li>
  <li>Network isolation between containers</li>
  <li>Automated orchestration with Docker Compose</li>
</ul>

<h2 id="about">🛠️ Installation</h2>
<img src="png/incept_docker.png" width="70%" alt="Running make command" /><br>
> **Prerequisite:**  
> Make sure you have Docker Desktop or Docker Engine installed on your computer before running the commands below.

<pre><code class="bash">
make
</code></pre>

<p>
<img src="png/incept_make.png" width="90%" alt="Running make command" /><br>
<em>Running <code>make</code> to build and start all services using Docker Compose.</em>
</p>

<p>
<img src="png/incept_done.png" width="70%" alt="Done" /><br>
<em>If successful, all Docker images, networks, volumes, and containers will be created and started automatically.</em>
</p>

<h3>🪐 Containers Overview</h3>
<p>
<strong>WordPress:</strong> The main web application, available at <code>http://localhost</code> or your configured domain.<br>
<strong>Nginx:</strong> Acts as a reverse proxy for WordPress.<br>
<strong>MariaDB:</strong> Serves as the database backend (not directly accessible via browser).
</p>

<h2 id="screenshots">📸 Screenshots</h2>

<h4>Simple docker commands 🤖</h4>
<p>
<img src="png/incept_list.png" width="70%" alt="Localhost Warning" /><br>
<em>Use <code>docker volume ls</code> to see all Docker volumes created for persistent data storage.</em><br>
<em>Use <code>docker images</code> to list all Docker images built for your services.</em><br>
<em>Use <code>docker container ls</code> to display all running containers for your project.</em><br>
</p>

<h4>Docker history for custom images 📜</h4>
<p>
<img src="png/maria_db_image_history.png" width="70%" alt="Localhost Warning" /><br>
<em>For this project, usage of base images is prohabited, like nginx:alpine or wordpress:latest.</em><br><br>
<em>Instead, we have to start from a minimal image (like alpine or debian) and install/configure everything using Dockerfile.</em><br>
</p>

<h4>WordPress Home 🌐</h4>
<p>
<img src="png/localhost_warning.png" width="70%" alt="Localhost Warning" /><br>
<img src="png/localhost_page.png" width="70%" alt="Localhost Page" /><br>
<em> Just ignore the self-signed SSL certificate warning. Access your site at <code>http://localhost</code>.</em>
</p>

<h4>MariaDB ⛁</h4>
<p>
<img src="png/maria_db_demo.png" width="70%" alt="MariaDB Demo" /><br>
<em>To interact with MariaDB, log in through the terminal using the <code>mysql</code> client or <code>docker exec</code> into the container. The database is not accessible via browser.</em>
</p>

<h4>Cleanup 🧹</h4>
<p>
<img src="png/incept_fclean.png" width="70%" alt="MariaDB Demo" /><br>
<em>To perform a full cleanup, this commit removes all Docker images, containers, networks, and volumes created by the project. Use the <code>make fclean</code> target to reset your Docker environment completely.</em>
</p>
