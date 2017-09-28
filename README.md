## Client IP to country

### Dependencies
1. MySQL

### Install
* `$git clone && cd test`,
* create structure from `dump.sql` to DB,
* Edit config `vim config.yml`,
* Run `$go run main.go` or `$go build && ./test`.

See the picture `task.png`

### Description config file (config.yml)

    addr: listen IP (example: 0,0,0,0)
    port: listen port (example: 8888)
    freqsec: pause access to services (example: freqsec=10 equal 6 requests in minut)
    validityip: validity of the cache IP, sec
    services: ["http://ip-api.com/json/", "http://geoip.nekudo.com/api/", "http://freegeoip.net/json/"]
    db:
        name:     test
        user:     root
        password: you_password
        port:     3306

### TODO:
* переместить (расхардкорить) JSON путь (к country_code) ответа сервиса, из `main.go` в `config.yml`. Т.к. у разных сервисов кастомный JSON.
* перейти на другую СУБД, а может даже на свое Go хранилище в памяти. И как вариант прикрутить MQ.
