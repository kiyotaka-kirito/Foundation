import UIKit

// Function
// Basic Function
func sayHello() {
    print("Hello! Start your coding day with a coffee.")
}
sayHello()

// Function with parameters
func makeCoffee(type: String, quantity: Int) {
    print("Making \(quantity) cups(s) of \(type)... Done!")
}
makeCoffee(type: "Latte", quantity: 2)

// Function with return value
func calculateBill(price: Double, tax: Double) -> Double {
    let total = price + tax
    return total
}
let myBill = calculateBill(price: 5.50, tax: 0.50)
print("Please pay: $\(myBill)")

// from (External) - hometown (Internal)
func greet(person name: String, from hometown: String) {
    print("Hello \(name)! How is the weather in \(hometown)?")
}
greet(person: "John", from: "Yangon")

// Homework
func addNumbers(a: Int, b: Int) -> Int {
    return a + b
}
let sum = addNumbers(a: 5, b: 8)
print("Sum: \(sum)")

func checkEven(number: Int) -> Bool {
    if number % 2 == 0 { return true }
    return false
}
let even = checkEven(number: 9)
print("Check even: \(even)")

print("")

// Advanced Function
// Default Parameters
func makeTea(type: String, sugarLevel: String = "Normal") {
    print("Making \(type) with \(sugarLevel) sugar.")
}
makeTea(type: "Green Tea")
makeTea(type: "Black Tea", sugarLevel: "Less Sugar")

// Varidic Parameters
func calculateTotal(prices: Double...) -> Double {
    var total: Double = 0
    for price in prices {
        total += price
    }
    return total
}

let grandTotal = calculateTotal(prices: 1.99, 5.50, 10.0, 2.50)
print("Grand Total: \(grandTotal)")

// In-out Parameters
var score = 10

func doubleScore(currentScore: inout Int) {
    currentScore = currentScore * 2
}
doubleScore(currentScore: &score)
print("New Score: \(score)")

// Function as First-Class Citizens
func add(a: Int, b: Int) -> Int { return a + b }
var mathFunction: (Int, Int) -> Int = add
print("Result: \(mathFunction(5, 5))")

// In Project
func createCharacter(name: String, role: String = "Warrior") {
    print("Character \(name) created as a \(role).")
}

func takeDamage(hp: inout Int, amount: Int) {
    hp -= amount
    if hp > 0 { hp == 0 }
    print("Took \(amount) damage! Current HP: \(hp)")
}

func collectItems(items: String...) {
    print("Inventory updated with: \(items.joined(separator: ", "))")
}

var myHP = 100
createCharacter(name: "Mogi")
takeDamage(hp: &myHP, amount: 30)
collectItems(items: "Sword", "Shield", "Potion", "Map")

// Homework
func calculateArea(width: Double, height: Double = 10.0) -> Double {
    return width * height
}
let area = calculateArea(width: 80.0)
print("Area: \(area)")

var myLevel = 1
func updateLevel(level: inout Int) {
    level += 1
    print("Level up: \(level)")
}
updateLevel(level: &myLevel)

func shoppingBill(items: Double...) {
    var total: Double = 0
    for item in items {
        total += item
    }
    print("Total Bill: \(total)")
}
shoppingBill(items: 1.25, 9.99, 20.28)
print("")

// Optionals
// Declare Optionals
var name: String = "Aung Aung"
var middleName: String? = nil
middleName = "Min"

// Unwrapping
// Force Unwrapping (!) - The Dangerous Way
print(middleName!)

// Optional Binding (if let) - The Safe Way
if let unwrappedName = middleName {
    print("Middle name is \(unwrappedName)")
} else {
    print("No middle name found.")
}

// Nil Coalescing (??) - The Default Way
let nameToDisply = middleName ?? "No Middle Name"
print(nameToDisply)

// Guard Statement (guard let) - The Professional Way
func printMiddleName(name: String?) {
    guard let realName = name else {
        print("Exiting: No name provided")
        return
    }
    print("The name is \(realName)")
}
printMiddleName(name: middleName)

// In Project
let inputEmail: String? = "dev.aung@gmail.com"
let inputPhone: String? = nil

func processLogin(email: String?, phone: String?) {
    guard let validEmail = email else {
        print("Login Failed: Email is required.")
        return
    }
    
    let displayPhone = phone ?? "N/A"
    
    print("Login Successful for: \(validEmail)")
    print("Contact Phone: \(displayPhone)")
}
processLogin(email: inputEmail, phone: inputPhone)

// Homework
var currentWeather: String? = "Sunny"

if let hasWeather = currentWeather {
    print("The weather is \(hasWeather)")
} else {
    print("Loading weather...")
}
print("")

// Closure
// Simple Function & Closure
func sayHelloFunc() {
    print("I am a function!")
}
let sayHelloClosure = {
    print("I am a closure! You can carry me around in a variable")
}
sayHelloFunc()
sayHelloClosure()

let driveCar = { (brand: String) in
    print("I am driving a \(brand).")
}
driveCar("Telsa")

// Shorthand Syntax
let numbers = [5, 2, 8, 1, 9]
let soretedNumbers = numbers.sorted(by: { (n1: Int, n2: Int) -> Bool in
    return n1 < n2
})
let shorthandSorted = numbers.sorted(by: { $0 < $1 })
print(shorthandSorted)

// Trailing Closures
func performAction(aciton: () -> Void) {
    print("Starting action...")
    aciton()
}
performAction {
    print("This is the action being performed!")
}

// Homework
func calculatePrice(originalPrice: Double, applyDiscount: (Double) -> Double) {
    print("Original Price: $\(originalPrice)")
    let finalPrice = applyDiscount(originalPrice)
    print("Discount Price: $\(finalPrice)")
}
calculatePrice(originalPrice: 100.0) { price in
    let discountValue = price * 0.8
    return discountValue
}
print("")

// Structs vs Classes
struct CarStruct {
    var model: String
}

var car1 = CarStruct(model: "Telsa Model 3")
var car2 = car1 // Copy
car2.model = "BMW i7"

print("Struct car1: \(car1.model)")
print("Struct car2: \(car2.model)")


class CarClass {
    var model: String
    
    init(model: String) {
        self.model = model
    }
}

var classCar1 = CarClass(model: "Telsa Model 3")
var classCar2 = classCar1 // Reference
classCar2.model = "BMW i7"

print("Class car1: \(classCar1.model)")
print("Class car2: \(classCar2.model)")

class Smartphone {
    let brand: String
    var batteryLevel: Int
    
    init(brand: String, batteryLevel: Int) {
        self.brand = brand
        self.batteryLevel = batteryLevel
    }
    
    func charge() {
        batteryLevel = 100
        print("\(brand) is fully charged!")
    }
}

let myPhone = Smartphone(brand: "iPhone 17", batteryLevel: 50)
myPhone.charge()

// Homework
struct Book {
    let title: String
    let author: String
}

class Library {
    var books: [Book]
    
    init(books: [Book]) {
        self.books = books
    }
    
    func addBook(book: Book) {
        books.append(book)
        print("\(book.title): \(book.author)")
    }
}

var library = Library(books: [])
library.addBook(book: Book(title: "Swift", author: "Apple"))
library.addBook(book: Book(title: "Kotlin", author: "Android"))
print("")

// Protocols & Extensions
// Protocols
protocol CanDrive {
    var licenseNumber: String { get }
    func drive()
}

protocol Powerable {
    var batteryLevel: Int { get set }
    func turnOn()
}

class Laptop: Powerable {
    var batteryLevel: Int = 100
    
    func turnOn() {
        print("MacBook is starting up... Screen Brightness 100%.")
    }
}

extension Int {
    func squared() -> Int {
        return self * self
    }
}

let myNumber = 5
print(myNumber.squared())

extension Powerable {
    func checkBattery() {
        print("Current battery is at \(batteryLevel)")
    }
}

let myMac = Laptop()
myMac.turnOn()
myMac.checkBattery()

// Homework
protocol Flyable {
    var maxAltitude: Double { get }
    func fly()
}

struct Bird: Flyable {
    let maxAltitude: Double = 500
    
    func fly() { print("Bird: \(maxAltitude.toFleet())") }
}

struct Airplane: Flyable {
    let maxAltitude: Double = 1000
    
    func fly() { print("Airplane: \(maxAltitude.toFleet())") }
}

extension Double {
    func toFleet() -> Double {
        return self * 3.28
    }
}

let myBird = Bird()
let myAirplane = Airplane()
myBird.fly()
myAirplane.fly()
print("")

// Review
// 1. Protocol
protocol Shippable {
    var weight: Double { get }
}

// 2. Struct
struct Package: Shippable {
    let title: String
    var weight: Double
}

class DeliveryDrone {
    var battery: Int = 100
    
    func deliver(item: Package?, completion: (Bool) -> Void) {
        guard let itemToShip = item else {
            print("Error: No package to deliver.")
            completion(false)
            return
        }
        print("Delivering \(itemToShip.title)... Weight: \(itemToShip.weight)kg")
        battery -= 10
        completion(true)
    }
}

extension DeliveryDrone {
    func checkBatteryStatus() {
        print("Current battery: \(battery)%")
    }
}

let myDrone = DeliveryDrone()
let myLaptop = Package(title: "MacBook M2 Pro", weight: 1.6)

myDrone.deliver(item: myLaptop) { success in
    if success {
        print("Delivery Successful!")
    }
}
myDrone.checkBatteryStatus()


