package main

import "fmt"

func main() {
	name := Get_User_Info()
	prompt := "Hello" 
	Greeting(name, prompt)
	Goodbye(name)
}

func Get_User_Info() (name string) {
	fmt.Printf("User's Name: ");
	fmt.Scan(&name)
	return 
}

// Print Salutation to User
func Greeting(name string, prompt string) {
	fmt.Printf("%s, %s\n", prompt, name)
}

func Goodbye(name string) {
	fmt.Printf("Goodbye, %s\n", name)
	fmt.Println("Try this again soon!")
}
