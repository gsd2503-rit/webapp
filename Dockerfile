FROM python:3.10-slim

WORKDIR /home/mca1/Desktop/python-app
COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .
EXPOSE 5000

CMD ["python", "app.py"]