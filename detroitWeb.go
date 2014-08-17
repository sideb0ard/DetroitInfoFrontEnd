package main

import (
	"fmt"
	"io/ioutil"
	"net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
	artistId := r.URL.Path[1:]
	info := getArtistInfo(artistId)
	fmt.Fprintf(w, "DETROIT TECHNO! %s", info)
}

func main() {
	http.HandleFunc("/", handler)
	http.ListenAndServe(":8080", nil)
}

func getArtistInfo(art_id string) string {
	resp, err := http.Get("http://localhost:8081/artist/" + art_id)
	if err != nil {
		return err.Error()
		// handle error
	}
	defer resp.Body.Close()
	body, err := ioutil.ReadAll(resp.Body)
	fmt.Println("YARR!")
	return (string(body[:]))
}
