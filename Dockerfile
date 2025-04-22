FROM python:3.12-slim


WORKDIR /app


COPY requirement.txt .


RUN apt-get update && \
    apt-get install -y git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


RUN pip install --upgrade pip && \
    pip install --prefer-binary -r requirement.txt

COPY . .


CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]


