# using official Python image
FROM python:3.9-slim

# set the working directory in the container
WORKDIR /app

# copy the current directory contents into the container at /app
COPY . /app

# install the dependencies from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# make port 8000 available to the outside of this container
EXPOSE 8000

# define environment variable
ENV FLASK_APP=core/server.py

# run the migrations and then the application
CMD flask db upgrade -d core/migrations/ && gunicorn -c gunicorn_config.py core.server:app