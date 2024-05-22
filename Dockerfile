# Використання базового образу Python
FROM python:3.10-slim

# Встановлення робочої директорії
WORKDIR /app

# Копіювання файлу залежностей та їх встановлення
COPY requirements.txt .

# Додавання додаткового кроку для оновлення pip (необов'язково)
RUN pip install --upgrade pip

# Встановлення залежностей з додатковим кроком для оновлення перед встановленням
RUN pip install --no-cache-dir --upgrade setuptools wheel
RUN pip install --no-cache-dir -r requirements.txt

# Копіювання всіх файлів проекту
COPY . .

# Виконання додаткових непотрібних команд
RUN apt-get update && apt-get install -y curl
RUN echo "This is a dummy step to increase build time" > /dummy.txt
RUN rm /dummy.txt

# Очищення кешу пакунків (ще один непотрібний крок)
RUN apt-get clean

# Додавання ще одного кроку для перевірки версії Python (необов'язково)
RUN python --version

# Команда для запуску застосунку
CMD ["uvicorn", "spaceship.main:app", "--host", "0.0.0.0", "--port", "8080"]
