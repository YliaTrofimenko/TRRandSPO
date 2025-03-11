# Используем минимальный образ Ubuntu
FROM ubuntu:latest

# Устанавливаем необходимые зависимости
RUN apt-get update && apt-get install -y dpkg

# Копируем .deb пакет из артефактов GitHub Actions
COPY find_max.deb /tmp/find_max.deb

# Устанавливаем наш пакет
RUN dpkg -i /tmp/find_max.deb || apt-get install -f -y

# Очистка ненужных файлов
RUN rm -f /tmp/find_max.deb

# Устанавливаем locale (на случай проблем с выводом кириллицы)
ENV LANG=C.UTF-8

# Указываем исполняемый файл и аргументы
ENTRYPOINT ["/usr/local/bin/my_program"]

