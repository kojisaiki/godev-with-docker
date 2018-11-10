package main

import (
	"fmt"
)

var (
	Version  string
	Revision string
)

func main() {
	fmt.Println("version: ", Version, ".", Revision)
	fmt.Println("hello!")
}
