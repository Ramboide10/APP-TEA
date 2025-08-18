FROM python:3.11-slim

WORKDIR /app
COPY . .

# Instala uma versão específica do pip que não causa conflitos
RUN pip install pip==23.3.1
RUN pip install --no-cache-dir -r requirements.txt

CMD ["gunicorn", "--bind", "0.0.0.0:10000", "--workers", "1", "--timeout", "120", "app:app"]
