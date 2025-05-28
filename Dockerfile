FROM python:3.10-slim

# Устанавливаем системные библиотеки, нужные reportlab
RUN apt-get update && apt-get install -y \
    build-essential \
    libfreetype6-dev \
    libjpeg-dev \
    liblcms2-dev \
    libopenjp2-7-dev \
    libtiff-dev \
    libwebp-dev \
    libart-dev \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .

# Устанавливаем зависимости
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

ENV PORT=8080

# Запускаем приложение через gunicorn
CMD ["gunicorn", "ui.app:app", "--bind", "0.0.0.0:8080"]
