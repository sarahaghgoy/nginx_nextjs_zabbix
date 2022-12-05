Overview:
=========
Running a full stack web server with Docker containers ,Nextjs  and Time web server

How this project work:
======================
There is 2 containers , ones run nextjs using repository below: <br>
https://github.com/tonykhbo/hello-world-nextjs <br>
Other one run container with frontend webserver and time service on http://example.com/time <br>
Web server helth check script on port 80 <br>
Zabbix Server setup on branch main <br>

Installation Instructions
=========================
Requirement: <br>
        OS:GNU/LINUX Debian 11 blueseys <br>
Commands: <br>
Clone project from github:<br>
git clone https://github.com/sarahaghgoy/fanap_project.git <br>
cd fanap_project/ <br>
./bootstrap.sh
