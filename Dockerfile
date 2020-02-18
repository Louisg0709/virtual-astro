# Use the latest ubuntu image as base for the new image
# ubuntu is the image name and latest is a tag that 
# references a particular version of the image.
# In this case latest is always the latest LTS image
# at the time of writing this, it's 16.04.
FROM ubuntu:latest

# Run a system update to get it up to speed
# Then install python3 and pip3
RUN apt-get update && apt-get install -y python3 \
    python3-pip && apt-get install -y git-core 
RUN apt-get install -y wget && apt-get install -y build-essential
RUN apt-get install -y cmake

RUN wget http://heasarc.gsfc.nasa.gov/FTP/software/fitsio/c/cfitsio-3.47.tar.gz
RUN tar -zxvf cfitsio-3.47.tar.gz

RUN cd cfitsio-3.47 && ./configure && make all
#RUN ls
#RUN ["chmod a+x configure
#RUN ./configure
#RUN ["make", "all"]
#RUN ["cd", ".."]


# Install jupyter
RUN pip3 install jupyter
RUN pip3 install matplotlib
RUN pip3 install pandas
RUN pip3 install -U scikit-learn
RUN pip3 install astropy
RUN pip3 install astroquery
RUN pip3 install aplpy
RUN pip3 install spectral-cube
RUN pip3 install reproject
RUN pip3 install seaborn
RUN pip3 install astro-gala
#RUN pip3 install -e .
#RUN pip3 install synphot
RUN pip3 install dust_extinction
RUN pip3 install dust_extinction --upgrade
RUN pip3 install sunpy[dev]
RUN pip3 install pycfitsio

# Add Tini. Tini operates as a process subreaper for jupyter. This prevents
# kernel crashes.
ENV TINI_VERSION v0.6.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
RUN chmod +x /usr/bin/tini
ENTRYPOINT ["/usr/bin/tini", "--"]




# Create a new system user
RUN useradd -ms /bin/bash jupyter

# Change to this new user
USER jupyter

# Set the container working directory to the user home folder
WORKDIR /home/jupyter

RUN git clone https://github.com/littlelogking/virtual-astro



#Jupyter
EXPOSE 8888
CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0"]



