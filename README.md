# virtual-astro
Virtual astronomy project - incubation


Full Description
Jupyter environment for running astropy.

With data analysis examples from Sloane Digital Sky survey. Includes examples of plotting Herzsprung Russel diagrams for globular clusers and Analysing galaxy cluster distributions.

Run using the command: docker run --rm -p 8888:8888 mikeg64/jupyter-py3-astropy


docker run -v E:\users\suilven\proj:/home/jupyter/notebooks --rm -p 8888:8888 mikeg64/jupyter-py3-astropy

To access jupyter open a browser and paste in the address provided by the docker container session.

Also contains matplotlib and scikit-learn (used for cluster classification)


When docker starts the Jupyter notebook it responds with a message like

    Copy/paste this URL into your browser when you connect for the first time,
    to login with a token:
        http://172.17.0.2:8888/?token=aa43e233d1d6c950c6250b871ffb75a0d8a0ab26c3c5fd93&token=aa43e233d1d6c950c6250b871ffb75a0d8a0ab26c3c5fd93

		 http://ec2-52-213-60-210.eu-west-1.compute.amazonaws.com:8888/?token=aa43e233d1d6c950c6250b871ffb75a0d8a0ab26c3c5fd93&token=aa43e233d1d6c950c6250b871ffb75a0d8a0ab26c3c5fd93

		 i.e. substitute 172.17.0.2:8888 with ec2-52-213-60-210.eu-west-1.compute.amazonaws.com:8888
		 
		 where ec2-52-213-60-210.eu-west-1.compute.amazonaws.com is the address 
		 "Connect to your instance"

4. Connect to your instance using it's Public DNS
           ec2-52-213-60-210.eu-west-1.compute.amazonaws.com

It's important to set 
Security group inbound rules and outbound rules		

set port 8888   
		
