FROM ubuntu

WORKDIR /app

COPY requirements.txt /app/
COPY Hello /app/

RUN apt-get update && apt-get install -y python3 python3-pip python3-venv

RUN python3 -m venv venv1 && \
    ./venv1/bin/pip install --no-cache-dir -r requirements.txt

EXPOSE 8000

CMD ["./venv1/bin/python", "manage.py", "runserver", "0.0.0.0:8000"]

