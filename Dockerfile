# FROM python:3.11.2

# WORKDIR /django-airbnb

# COPY requirements.txt .

# RUN pip install -r requirements.txt

# COPY . .

# EXPOSE 8000

# CMD ["python", "manage.py", "runserver"]


FROM python:3.8-slim-buster
ENV PYTHONUNBUFFERED True
WORKDIR /app
COPY requirements.txt requirements.txt
RUN apt-get update \
    && apt-get -y install libpq-dev gcc
RUN pip install -r requirements.txt
COPY . ./
EXPOSE 8080
RUN python manage.py collectstatic --no-input
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]