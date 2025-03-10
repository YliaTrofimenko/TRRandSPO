#!/bin/bash

echo "Запуск тестов..."

# Компиляция программы
make

# Тест 1: Проверка обработки пустого ввода
echo "3456 2 23 4 -4" | ./my_program > output.txt
grep "Максимальное значение: 3456" output.txt
if [ $? -ne 0 ]; then
  echo "Тест 1 не пройден!"
  exit 1
fi

# Тест 2: Проверка корректного поиска максимума
echo "1 2 3 4 5" | ./my_program > output.txt
grep "Максимальное значение: 5" output.txt
if [ $? -ne 0 ]; then
  echo "Тест 2 не пройден!"
  exit 1
fi

# Тест 3: Проверка работы с отрицательными числами
echo "-1 -2 -3 -4 -5" | ./my_program > output.txt
grep "Максимальное значение: -1" output.txt
if [ $? -ne 0 ]; then
  echo "Тест 3 не пройден!"
  exit 1
fi

echo "Все тесты пройдены успешно!"
exit 0

