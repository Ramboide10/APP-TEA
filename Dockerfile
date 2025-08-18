FROM python:3.11-slim

WORKDIR /app
COPY . .

# Instala pip específico e limpa cache
RUN pip install --upgrade pip==23.0.1 && \
    pip install --no-cache-dir -r requirements.txt

CMD ["gunicorn", "--bind", "0.0.0.0:10000", "--workers", "1", "--timeout", "120", "app:app"]
