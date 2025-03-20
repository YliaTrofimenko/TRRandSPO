# Используем минимальный образ Ubuntu
FROM ubuntu:latest

# Устанавливаем необходимые зависимости
RUN apt-get update && apt-get install -y \
    dpkg \
    apt-utils \
    && rm -rf /var/lib/apt/lists/*

# Копируем .deb пакет из артефактов GitHub Actions
COPY find-max_1.0-1_amd64.deb /tmp/find_max.deb

# Устанавливаем наш пакет и зависимостей
RUN dpkg -i /tmp/find_max.deb || apt-get install -f -y

# Очистка ненужных файлов
RUN rm -f /tmp/find_max.deb

# Устанавливаем locale (на случай проблем с выводом кириллицы)
ENV LANG=C.UTF-8

# Убедимся, что файл имеет права на выполнение
RUN chmod +x /usr/local/bin/my_program

# Указываем исполняемый файл и аргументы
ENTRYPOINT ["/usr/local/bin/my_program"]

# Значения по умолчанию для аргументов, которые могут быть изменены при запуске контейнера
CMD ["1", "2", "3", "4", "5"]

