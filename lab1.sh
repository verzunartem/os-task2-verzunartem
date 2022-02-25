#!/usr/bin/env bash

# edit the code below and add your code
# отредактируйте код ниже и добавьте свой

# Переменная с номером варианта (константа):
TASKID=4

# Дополнительные переменные (должны вычисляться динамически):
#Записываем в переменную кол-во записей (wc -l)
VAR_1=$(cat dns-tunneling.log | awk '{print $4;}'|sort|wc -l)
#Записываем самый ранний DNSзапрос, сортируем записи и выбираем первую(самую раннюю)
VAR_3=$(cat dns-tunneling.log | awk '{print $4;}'|sort|head -n1)
#Аналогично выбираем последнюю(самую позднюю)
VAR_4=$(cat dns-tunneling.log | awk '{print $4;}'|sort|tail -n1)
#Находим самый ранний запрос и его IP 
var5=$(cat dns-tunneling.log | awk '{print $4,$5;}'|sort|head -n1)
#Передаем значение из VAR_5, но только IP
var6=${var5:18}
#Считаем среди всех IP, сколько встречается IP самого раннего запроса
VAR_2=$(cat dns-tunneling.log | awk '{print $5;}'|grep -c $var6)
echo "Кол-во записей в файле: "
echo $VAR_1
echo "Кол-во запросов с IP самого раннего запроса: "
echo $VAR_2
echo "Самый ранний DNS-запрос: "
date -d @$VAR_3
echo "Самый поздний DNS-запрос: "
date -d @$VAR_4
#Очистка файла
echo -n > results.txt
#Вывод данных в файл
date -d @$VAR_3 >> results.txt
date -d @$VAR_4 >> results.txt
