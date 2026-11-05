FROM ubuntu:24.04

LABEL maintainer="Phan Huu Tuong"

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    python3-venv \
    python3-dev \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /flask_app

COPY requirements.txt .

RUN python3 -m venv /opt/venv \
    && /opt/venv/bin/python -m pip install --no-cache-dir -r requirements.txt

COPY flask_docker.py .

ENV PATH="/opt/venv/bin:${PATH}"

EXPOSE 5000

ENTRYPOINT ["python3"]
CMD ["flask_docker.py"]
