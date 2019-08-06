# user17

FROM ubuntu:18.04

# set environment variables
ENV HOME_DIR="/opt/docker-sample"
ENV FLASK_APP="app.py"

# install base packages
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils python-pip git
# RUN apt-get update && apt-get install -y apt-utils python-pip git

# install flask 
RUN pip install flask pyyaml
COPY ./source ${HOME_DIR}

# setting flask
ADD flask.conf ${HOME_DIR}/flask.conf

WORKDIR ${HOME_DIR}

# expose & run flask server
EXPOSE 5000
ENTRYPOINT ["/usr/local/bin/flask", "run"]
CMD ["-h", "0.0.0.0"]

