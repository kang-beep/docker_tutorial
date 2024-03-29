FROM python:3.8-slim

WORKDIR /app

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

COPY . .

RUN pip install flask && \
    pip install Werkzeug

CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:8000", "app:app"]