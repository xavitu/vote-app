FROM python:3.10-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
ENV PROMETHEUS_MULTIPROC_DIR=/tmp
RUN mkdir -p /tmp
ENV GUNICORN_WORKERS=4
ENV GUNICORN_PORT=5000
COPY . .
EXPOSE ${GUNICORN_PORT}
CMD ["sh", "-c", "gunicorn \
    -w ${GUNICORN_WORKERS} \
    -b 0.0.0.0:${GUNICORN_PORT} \
    --config src/gunicorn_config.py \
    'src.app:create_app_for_gunicorn()'"]
