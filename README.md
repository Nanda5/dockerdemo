Building Spring Boot Project using Jenkins CI/CD pipeline with docker images on AWS Free Tier.

Main Source Link (https://learn.sandipdas.in/2021/06/03/build-docker-image-using-jenkins-pipeline/)

Step 1 Jenkins Installation in EC2 instance
---------------------------------------------------
Prerequisites(https://www.jenkins.io/doc/tutorials/tutorial-for-installing-jenkins-on-AWS/)
 
 1.  An AWS account. If you don’t have one, you can register here.
 2. An Amazon EC2 key pair. If you don’t have one.
 
 Installing and configuring Jenkins.
 
 1.  Select the instance and locate Public DNS from AWS Ec2 new instance.
 2.  After Connecting through git bash/putty use below steps/commands to install jenkins

	sudo yum update –y
	sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
	sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
	sudo yum upgrade
	sudo amazon-linux-extras install java-openjdk11 -y
	sudo yum install jenkins -y
	sudo systemctl enable jenkins
	sudo systemctl start jenkins
	sudo systemctl status jenkins

Configuring Jenkins

	 sudo cat /var/lib/jenkins/secrets/initialAdminPassword
 give any user name & password after above step.

---------------------------------------------------------

Step 2 Docker Installation in Same Ec2 Instance(https://docs.aws.amazon.com/AmazonECS/latest/developerguide/docker-basics.html) 
---------------------------------------------------
Install Docker on an Amazon EC2 instance

	sudo yum update -y
	sudo amazon-linux-extras install docker
	sudo service docker start
	sudo systemctl enable docker
	sudo usermod -a -G docker ec2-user
--------------------------------------------------

Add Jenkins user to Docker group
-----------------------------
	sudo usermod -a -G docker jenkins	

Restart Jenkins & Docker service 
------------------------------------
	sudo service jenkins restart
	sudo systemctl daemon-reload
	sudo service docker restart
	
--------------------------------------------------
Install Jenkins plugins for Docker using plugins
----------------------------
1. Docker plug-in 
2. Docker pipeline plug-in


----------------------------------
Next Step: Create IAM role and With AmazonEC2ContainerRegistryFullAccess policy and attach with the Jenkins EC2 Instance
--------

--------------------------
Create Pipeline script which is attached in current project as jenkinfile & use while creating pipeline item in jenkins from git
----


