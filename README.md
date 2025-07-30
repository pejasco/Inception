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
  <li><a href="#license">License</a></li>
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


<pre><code class="bash">
make
</code></pre>

<p>
<img src="png/incept_make.png" width="60%" alt="Running make command" /><br>
<em>Running <code>make</code> to build and start all services using Docker Compose.</em>
</p>

<p>
<img src="png/incept_done.png" width="60%" alt="Done" /><br>
<em>If successful, all Docker images, networks, volumes, and containers will be created and started automatically.</em>
</p>

<h3>🪐 Containers Overview</h3>
<p>
<strong>WordPress:</strong> The main web application, available at <code>http://localhost</code> or your configured domain.<br>
<strong>Nginx:</strong> Acts as a reverse proxy for WordPress.<br>
<strong>MariaDB:</strong> Serves as the database backend (not directly accessible via browser).
</p>

<h2 id="screenshots">📸 Screenshots</h2>

<p>
<img src="png/localhost_warning.png" width="70%" alt="Localhost Warning" /><br>
<img src="png/localhost_page.png" width="70%" alt="Localhost Page" /><br>
<em> Just ignore the self-signed SSL certificate warning. Access your site at <code>http://localhost. </em>
</p>

<!-- <p>
<img src="png/localhost_warning.png" width="70%" alt="Localhost Warning" /><br>
<img src="png/localhost_page.png" width="70%" alt="Localhost Page" /><br>
<em> Just ignore the self-signed SSL certificate warning. Access your site at <code>http://localhost. </em>
</p> -->