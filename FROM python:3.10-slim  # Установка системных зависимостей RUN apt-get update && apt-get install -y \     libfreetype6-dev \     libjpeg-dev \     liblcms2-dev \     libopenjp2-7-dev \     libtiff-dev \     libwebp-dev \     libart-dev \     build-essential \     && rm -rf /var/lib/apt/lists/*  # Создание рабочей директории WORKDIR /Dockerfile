FROM python:3.10-slim

# Установка системных зависимостей
RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg-dev \
    liblcms2-dev \
    libopenjp2-7-dev \
    libtiff-dev \
    libwebp-dev \
    libart-dev \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Создание рабочей директории
WORKDIR /app

# Копирование зависимостей и установка
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Копирование исходного кода
COPY . .

# Установка переменной среды для Railway
ENV PORT=8080

# Запуск приложения через gunicorn
CMD ["gunicorn", "ui.app:app", "--bind", "0.0.0.0:8080"]
