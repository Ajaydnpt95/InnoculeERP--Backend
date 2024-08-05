# Use the official Python image as the base image
FROM python:3.11

# Set environment variables for Python
#ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Create and set the working directory
WORKDIR /app

# Copy the requirements file to the working directory
COPY requirements.txt /app/

# Copy env file
#COPY .env /app/

# Install dependencies
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# Copy the Django project files to the working directory
COPY . /app/

# Re-enable collectstatic after setting up the static root
#RUN python manage.py collectstatic --noinput

# Expose the port that Django will run on (adjust as needed)
EXPOSE 8000

# Command to run when the container starts
ENTRYPOINT ["./entrypoint.sh"]
