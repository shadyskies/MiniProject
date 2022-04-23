FROM python:3
RUN apt update && apt install -y ffmpeg
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
WORKDIR /backend/
COPY requirements.txt /backend/
RUN pip3 install -r requirements.txt
COPY . /backend/
RUN python3 manage.py collectstatic