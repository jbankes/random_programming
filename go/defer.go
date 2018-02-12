package main

// file: defer.go
// Author: Justin Bankes
// This is a test about defers. I was curious about what happens with the
// value when you called a defer with a parameter then changed it.
// This will print
// 2
import "fmt"

func main() {
	value := 1
	defer Goodbye(value) // prints 1
	value++
	Hello(value) // prints 2
}

func Hello(value int) {
	fmt.Printf("%d\n", value)
}

func Goodbye(value int) {
	fmt.Printf("%d\n", value)
}
