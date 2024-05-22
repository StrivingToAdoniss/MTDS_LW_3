# Використання базового образу Python
FROM python:3.10-slim

# Встановлення робочої директорії
WORKDIR /app

# Копіювання файлу залежностей та їх встановлення
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Копіювання всіх файлів проекту
COPY . .

# Команда для запуску застосунку
CMD ["uvicorn", "spaceship.main:app", "--host", "0.0.0.0", "--port", "8080"]