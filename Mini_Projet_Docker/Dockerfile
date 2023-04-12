FROM ubuntu:latest

RUN apt-get update && apt-get install -y ansible

COPY create_users.yml /create_users.yml
COPY script.sh /script.sh
COPY requirements.txt /requirements.txt

RUN ansible-galaxy collection install community.general

RUN chmod +x /script.sh

CMD ["/script.sh"]
