package main

import (
	"encoding/json"
	"flag"
	"fmt"
	"log"
	"net/http"
	"strconv"

	"github.com/jinzhu/configor"
	"github.com/valyala/fasthttp"

	_ "github.com/go-sql-driver/mysql"
	"github.com/jmoiron/sqlx"
)

// Config : structure
var Config = struct {
	Addr       string `default:"0.0.0.0"`
	Port       string `default:"8888"`
	Freqsec    string   `default:"10"`
	Validityip string   `default:"600"`
	Services   []string `default:"[http://ip-api.com/json/]"`
	DB         struct {
		Name     string `required:"true"`
		User     string `default:"root"`
		Password string `required:"true"`
		Port     string `default:"3306"`
	}
}{}

// Country : this structure for "country" table
type Country struct {
	Country string `db:"country"`
}

// URL : this structure for get url from store function
type URL struct {
	URL string `db:"url"`
}

// CountryCode : this structure for
type CountryCode struct {
	CountryCode1 string `json:"countryCode"`
	CountryCode2 string `json:"country_code"`
	CountryCode3 string `json:"country.code"`
}

var (
	// addr     = flag.String("addr", ":8080", "TCP address to listen to")
	compress = flag.Bool("compress", false, "Whether to enable transparent response compression")
)

func main() {

	configor.Load(&Config, "config.yml")

	go start()

	h := requestHandler
	if *compress {
		h = fasthttp.CompressHandler(h)
	}

	if err := fasthttp.ListenAndServe(Config.Addr+":"+Config.Port, h); err != nil {
		log.Printf("Error in ListenAndServe: %s", err)
	}
}

func requestHandler(ctx *fasthttp.RequestCtx) {

	conn, err := sqlx.Connect("mysql", Config.DB.User+":"+Config.DB.Password+"@tcp(localhost:"+Config.DB.Port+")/"+Config.DB.Name)
	if err != nil {
		log.Println(err)
	}

	ip := "8.8.8.8"
	// ip := "8.8.4.4"
	var res Country
point:

	// Пробуем получить айпишник из таблицы
	err = conn.Get(&res, "SELECT country.country FROM country WHERE country.ip = '"+ip+"' AND (UNIX_TIMESTAMP() - inserted) < "+Config.Validityip)
	// err = conn.Get(&res, "SELECT get_country_function("+ip+")")
	if err != nil {
		log.Println("Error or not get country in table")
	}

	if len(res.Country) == 2 {
		log.Println("Country received from table", res.Country)
	}

	// Если ответ из кеш-таблицы пуст, то идем к сервису геоайпи, полученое новое значение заносим в таблицу.
	// После чего отправляемся в точку point: и начинаем заново искать уже занесенные данные.
	if len(res.Country) < 2 {
		country := getDataByIP(ip)

		if len(country) > 0 {
			sql := "INSERT INTO country (country, ip, validityip, inserted) VALUES (?, ?, ?, UNIX_TIMESTAMP())"
			conn.MustExec(sql, country, ip, Config.Validityip)
			log.Println("Inserted new row in table")
			goto point
		}

	} else {
		fmt.Fprintf(ctx, "%s", res.Country)
	}

	ctx.SetContentType("text/plain; charset=utf8")
	// ctx.SetContentType("application/json")
	// Set arbitrary headers
	ctx.Response.Header.Set("X-My-Header", "my-header-value")

	// Set cookies
	var c fasthttp.Cookie
	c.SetKey("my_cookie-name")
	c.SetValue("my_cookie-value")
	ctx.Response.Header.SetCookie(&c)

	// Без defer дает лучшие показатели теста.
	conn.Close()
}

func getDataByIP(ip string) string {
	// func getDataByIP(ip net.IP) []byte {

	conn, err := sqlx.Connect("mysql", Config.DB.User+":"+Config.DB.Password+"@tcp(localhost:"+Config.DB.Port+")/"+Config.DB.Name)
	if err != nil {
		log.Println("Error connect", err)
	}

	var url string
	err = conn.Get(&url, "SELECT get_url_function("+Config.Freqsec+")")
	if err != nil {
		log.Println("Error get country from db")
	}

	// url += ip.String()
	url += ip
	log.Println("Selected URL", url)

	resp, err := http.Get(url)
	if err != nil {
		log.Printf("Error get geoIP: %s", err)
	}
	var cc CountryCode
	decoder := json.NewDecoder(resp.Body)
	err = decoder.Decode(&cc)
	if err != nil {
		log.Printf("%T\n%s\n%#v\n", err, err, err)
	}

	var res string

	switch {

	case len(cc.CountryCode1) == 2:
		res = cc.CountryCode1
		// fmt.Println("> 1")

	case len(cc.CountryCode2) == 2:
		res = cc.CountryCode2
		// fmt.Println("> 2")

	case len(cc.CountryCode3) == 2:
		res = cc.CountryCode3
		// fmt.Println("> 3")

	default:
		res = "All servers busy. Waiting time approx... " + Config.Freqsec
	}
	defer conn.Close()
	defer resp.Body.Close()
	return res
}

func start() string {
	log.Println("Start script run...")
	conn, err := sqlx.Connect("mysql", Config.DB.User+":"+Config.DB.Password+"@tcp(localhost:"+Config.DB.Port+")/"+Config.DB.Name)
	if err != nil {
		log.Println("Error connect", err)
	}

	conn.MustExec("truncate table url")

	for k, v := range Config.Services {

		_, err := conn.Exec("INSERT INTO url (`url`, `time_at`) VALUES (?,?)", v, k)
		if err != nil {
			panic(err)
		}
	}

	defer conn.Close()
	frq, _ := strconv.Atoi(Config.Freqsec)

	log.Println("Frequency req. services in minute...", 60/frq)
	log.Println("Start script Ok...")

	return "true"
}
