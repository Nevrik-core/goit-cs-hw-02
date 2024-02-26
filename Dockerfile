# Використовується офіційний образ Python як базовий
FROM python:3.10-bullseye

# Встановлення робочої директорії у контейнері
WORKDIR /code

# Копіювання файлу залежностей у поточну директорію
COPY requirements.txt .

# Встановлення залежностей
RUN pip install --no-cache-dir -r requirements.txt

# Копіювання всього вмісту локальної папки у контейнер
COPY . .

# Команда для запуску додатку
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--reload"]
