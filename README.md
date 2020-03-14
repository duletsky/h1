# h1 - пример на Haskell/Scotty

Rest сервис на Haskell

http://seanhess.github.io/2015/08/19/practical-haskell-json-api.html

## Запуск

Из каталога проекта
```
stack run
```

Вообще
```
stack exec h1-exe
```

## Замеры

На 10_000 запросов в 4 потока:
```
ab -n 10000 -c 4 -k http://127.0.0.1:3000/users/1
```
Даёт _2947.47_ rps:
```
Total transferred:      1540000 bytes
HTML transferred:       310000 bytes
Requests per second:    2947.47 [#/sec] (mean)
Time per request:       1.357 [ms] (mean)
Time per request:       0.339 [ms] (mean, across all concurrent requests)
Transfer rate:          443.27 [Kbytes/sec] received
```

А вот на 100_000 падает:
```
ab -n 100000 -c 4 -k http://127.0.0.1:3000/users/1
This is ApacheBench, Version 2.3 <$Revision: 1843412 $>
Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
Licensed to The Apache Software Foundation, http://www.apache.org/

Benchmarking 127.0.0.1 (be patient)
apr_socket_recv: Operation timed out (60)
Total of 6229 requests completed
```
Описание оч похожих симптомов - https://stackoverflow.com/questions/6623391/how-to-gain-control-of-a-5gb-heap-in-haskell
Подвисание на некоторых запросах
