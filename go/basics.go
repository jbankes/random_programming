package main

import "fmt"

func main() {
	var name string
	prompt := "Hello" 
	fmt.Scan(&name)
	defer Goodbye(name)
	Greeting(prompt, name)
}

// Print Salutation to User
func Greeting(name string, prompt string) {
  fmt.Printf("%s, %s\n", name, prompt)
}

func Goodbye(name string) {
	fmt.Printf("Goodbye, %s\n", name)
}
