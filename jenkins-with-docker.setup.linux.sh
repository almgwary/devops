# Before doing the steps make sure you have java1.8 rather then default java1.7 ship with Amazon AMI.
# If you could see the 1.7 version you can uninstall and install the 1.8 using following commands,
sudo yum remove java-1.7.0-openjdk
sudo yum install java-1.8.0

# let’s update the repositories and install Docker and Git:
sudo yum update -y
sudo yum install -y docker git

# Add the Jenkins repository and install Jenkins from there:
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins.io/redhat/jenkins.repo
sudo rpm — import https://pkg.jenkins.io/redhat/jenkins.io.key
sudo yum install jenkins -y --nogpgcheck
sudo usermod -aG root jenkins # Add jenkins to the root group

# Add Jenkins and current user to the Docker group
sudo usermod -aG docker $USER
sudo usermod -aG docker jenkins

# Add Jenkins and Docker to startup
sudo chkconfig jenkins on
sudo chkconfig docker on
sudo chkconfig --list

# Start Jenkins and Docker as a service
sudo service jenkins start
sudo service docker start

# At this point you should be able to see the Jenkins home page using the public address and port 8080 (ip:8080)

# Get the password from the indicated file:
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
# Enter the passowrd at (ip:8080)


# Install the recommended plugins and create an Admin account in the following steps.
# Install Jenkins Plugins
# At the Jenkins home page on the left menu select Manage Jenkins -> Manage Plugins select the tab Available and search for the following plugins:
# Blue Ocean - New Jenkins UI
# Pipeline AWS - AWS Integration

