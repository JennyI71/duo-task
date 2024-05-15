Flask-app;

# Use Python 3.6 as a base image

FROM python:3.6

# Copy contents into image

WORKDIR /app

COPY . .

# Install pip dependencies from requirements

RUN pip install -r requirements.txt

# Expose the correct port

EXPOSE 5500

# Create an entrypoint

ENTRYPOINT [ "python", "app.py" ]

Nginx;

# Use nginx:latest as a base image

FROM nginx:latest

# Copy our custom nginx.conf into the correct location

COPY nginx.conf /etc/nginx/nginx.conf
