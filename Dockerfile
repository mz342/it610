# Use an official Ubuntu base image
FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list and install necessary packages
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    nginx \
    sqlite3

# Install Flask
RUN pip install Flask

# Copy Swiftly application files to the container
COPY ./swiftly-app /project/swiftly-app

# Copy the SQL script from within the swiftly-app directory
COPY ./swiftly-app/sql_script.sql /project/swiftly-app

#templates
COPY ./templates /project/templates

# Set up any configuration files
COPY ./config/swiftly.conf /project/config/swiftly.conf

# Expose the port my Swiftly app will run on
EXPOSE 80

# Update the CMD to run the Python script
CMD ["python3", "/project/swiftly-app/swiftly-app-executable"]

