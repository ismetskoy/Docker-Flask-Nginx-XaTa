# Базовый образ для Flask
FROM python:3.11.4

# Установка зависимостей Flask
RUN pip3 install --upgrade pip
COPY app/requirements.txt /app/requirements.txt
RUN pip3 install -r /app/requirements.txt

# Копирование кода приложения 1
COPY app /app
WORKDIR /app

# Запуск Flask-приложения
CMD service nginx start && python /app/app.py

# Установка Nginx
RUN apt update && apt install -y nginx && apt install nano

# Копирование конфигурации Nginx
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

# Открытие порта 49153 3
EXPOSE 49153