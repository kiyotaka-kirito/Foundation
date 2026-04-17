import UIKit

// Properties & Access Control
// Stored & Computed Properties
struct Rectangle {
    var width: Double // Stored Property
    var height: Double // Stored Property
    
    // Computed Property
    var area: Double {
        return width * height
    }
}

var myRoom = Rectangle(width: 10, height: 12)
print("Area: \(myRoom.area)")

// Property Observers (willSet & didSet)
struct stepTracker {
    var totalSteps: Int = 0 {
        willSet {
            print("Steps are about to change to \(newValue)")
        }
        didSet {
            print("Steps changed! You just added \(totalSteps - oldValue) steps.")
        }
    }
}

var myWalk = stepTracker()
myWalk.totalSteps = 500
myWalk.totalSteps = 1000

// Access Contorl
class BankAccount {
    private var balance: Double = 0.0
    
    func deposit(amount: Double) {
        balance += amount
        print("Deposited: $\(amount), New Balance: $\(balance)")
    }
    
    func getBalance() -> Double {
        return balance
    }
}

let myAcc = BankAccount()
myAcc.deposit(amount: 1000)
myAcc.deposit(amount: 500)
// myAcc.balance = 1000000

// Homework
struct Thermostat {
    var temperature: Double = 0.0 {
        didSet {
            if temperature > 30 {
                print("Warning: Too Hot! Turning on Fan")
            }
        }
    }
    
    var isFahrenheit: Bool = false
    
    var currentReading: Double  {
        if isFahrenheit {
            return (temperature * 9/5) + 32
        }
        return 0
    }
}

var myThero = Thermostat()
myThero.temperature = 32
myThero.isFahrenheit = true
var fahrenheit = myThero.currentReading
print(fahrenheit)
print("")

// Inheritance & Polymorphism
// Inheritance
class Vehicle {
    var brand: String
    
    init(brand: String) {
        self.brand = brand
    }
    
    func makeNoise() {
        print("Making some generic vehicle noise...")
    }
}

class Car: Vehicle {
    var numberOfDoors: Int = 4
}

let myCar = Car(brand: "Toyota")
print(myCar.brand)
myCar.makeNoise()

class ElecticCar: Car {
    override func makeNoise() {
        print("Whirr... (Silent electric sound")
    }
}

let myTelsa = ElecticCar(brand: "Tesla")
myTelsa.makeNoise()

// Polymorphism
let car1 = Car(brand: "Honda")
let car2 = ElecticCar(brand: "BYD")

let garage: [Vehicle] = [car1, car2]

for vehicle in garage {
    vehicle.makeNoise()
}

// In Project
class Enemy {
    var health: Int = 100
    
    func attack() {
        print("Enemy attacks with 5 damage!")
    }
}

class Dragon: Enemy {
    override func attack() {
        print("Dragon breathes fire! 50 damage!")
    }
    
    func fly() {
        print("Dragon is flying high.")
    }
}

class Zombie: Enemy {
    override func attack() {
        super.attack()
        print("Zombie also bites! +2 damage!")
    }
}

let dragon = Dragon()
let zombie = Zombie()
let enemies: [Enemy] = [dragon, zombie]

for enemy in enemies {
    enemy.attack()
}

// Homework
class Animal {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func makeSound() {
        print("Animal Voice")
    }
}

class Dog: Animal {
    override func makeSound() {
        print("Woof!")
    }
}

class Cat: Animal {
    override func makeSound() {
        print("Meow!")
    }
}

let dog = Dog(name: "Woody")
let cat = Cat(name: "Kitty")
let animals: [Animal] = [dog, cat]

for animal in animals {
    animal.makeSound()
}
print("")

// Error Handling
// Defining Error
enum VendingMachineError: Error {
    case invalidSection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

// Throwing Functions
func checkStock(item: String) throws {
    let stock = 0
    if stock == 0 {
        throw VendingMachineError.outOfStock
    }
}

// In Project
enum ATMError: Error {
    case insufficientBalance
    case invalidAmount
}

struct BankAccount1 {
    var balance: Int
    
    func withdraw(amount: Int) throws {
        if amount <= 0 {
            throw ATMError.invalidAmount
        }
        
        if amount > balance {
            throw ATMError.insufficientBalance
        }
        
        print("Success! you withdraw $\(amount)")
    }
}

let myAccount = BankAccount1(balance: 100)

do {
    try myAccount.withdraw(amount: 101)
} catch ATMError.insufficientBalance {
    print("Sorry, your balance is not enough.")
} catch ATMError.invalidAmount {
    print("Please enter a valid amount.")
} catch {
    print("An unknown error occurred: \(error)")
}

// Homework
enum DownloadError: Error {
    case noInternet
    case fileNotFound
}

func downlaodFile(fileName: String) throws {
    if fileName.isEmpty {
        throw DownloadError.fileNotFound
    }
    print("Success! downloaded")
}

do {
    try downlaodFile(fileName: "gmail")
} catch DownloadError.fileNotFound {
    print("Sorry, Your download file is not found")
} catch DownloadError.noInternet {
    print("Please, check your internet connection")
} catch {
    print("An unknown error occurred: \(error)")
}
print("")

// Type Casting & Generics
// Type Casting
class Media {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: Media {
    var director: String
    
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: Media {
    var artist: String
    
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

let Library: [Media] = [
    Movie(name: "Inception", director: "Christopher Nolan"),
    Song(name: "Perfect", artist: "Ed Sheeran")
]

for item in Library {
    if let movie = item as? Movie {
        print("Movie: \(movie.name), Dir: \(movie.director)")
    } else if let song = item as? Song {
        print("Song: \(song.name), Artist: \(song.artist)")
    }
}

// Generic
func swapValues<T> (a: inout T, b: inout T) {
    let temp = a
    a = b
    b = temp
}

var firstInt = 10
var secondInt = 20
swapValues(a: &firstInt, b: &secondInt)
print("firstInt: \(firstInt), secondInt: \(secondInt)")

var firstString = "Apple"
var secondString = "Banana"
swapValues(a: &firstString, b: &secondString)
print("firstString: \(firstString), secondString: \(secondString)")

// In Project
struct Box<T> {
    var content: T
    
    func getDetails() {
        print("This is contains: \(content)")
    }
}

let intBox = Box(content: 100)
intBox.getDetails()

let stringBox = Box(content: "Diamond Ring 💍")
stringBox.getDetails()

let arrayBox = Box(content: ["iPhone", "MacBook", "iPad"])
arrayBox.getDetails()

// Homework
struct Stack<Element> {
    var items: [Element] = []
    
    mutating func push(item: Element) {
        items.append(item)
    }
    
    mutating func pop() -> Element? {
        items.popLast()
    }
}
print("")

// Enums & Extension (Level Up)
// Enums with RawValues
enum Planet: Int {
    case mercury = 1
    case venus
    case earth
    case mars
}

let ourHome = Planet.earth
print("Earth is plant number \(ourHome.rawValue)")

// Enums with Associated Values
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productCode = Barcode.upc(8, 85090, 51226, 3)
productCode = .qrCode("ABCDEFG")

switch productCode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check)")
case .qrCode(let code):
    print("QR Code: \(code)")
}

// Extension (Level Up)
extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
}

let marathon: Double = 42.cm
print("A marathon is \(marathon) meters long.")

// In Project
enum OrderStatus {
    case processing
    case shipped(trackingID: String)
    case delivered
    case cancelled(reason: String)
}

func updateStatus(status: OrderStatus) {
    switch status {
    case .processing:
        print("We are preparing your item.")
    case .shipped(let trackingID):
        print("Your order is on the way! Tracking: \(trackingID)")
    case .delivered:
        print("Order received. Enjoy!")
    case .cancelled(let reason):
        print("Order status updated: \(reason)")
    }
}

let myOrder = OrderStatus.shipped(trackingID: "KBZ-12345")
updateStatus(status: myOrder)

//Homework
enum PizzaSize: Double {
    case small = 5.99
    case medium = 8.99
    case large = 12.99
}

enum Topping {
    case meat(name: String)
    case veggie(name: String)
}

func calculatePrice(size: PizzaSize, topping: Topping) {
    let basePrice = size.rawValue
    var toppingPrice: Double = 0
    var toppingName: String = ""
    
    switch topping {
    case .meat(let name):
        toppingPrice = 5
        toppingName = name
    case .veggie(let name):
        toppingPrice = 2
        toppingName = name
    }
    
    let total = basePrice + toppingPrice
    print("Your pizza price is \(total) with \(toppingName)")
}
calculatePrice(size: .large, topping: .veggie(name: "Pork"))
print("")

// Memory Management (ARC - Automatic Reference)
class Tenant {
    var name: String
    weak var landlord: Landlord? // weak - remove reference count
    
    init(name: String) { self.name = name }
    deinit { print("\(name) is being deinitialized (Memory freed!)") }
}

class Landlord {
    var name: String
    var tenant: Tenant?
    
    init(name: String) { self.name = name }
    deinit { print("\(name) is being deinitialized") }
}

// In Project
class Person {
    let name: String
    var apartment: Apartment?
    
    init(name: String) { self.name = name }
    deinit { print("\(name) is leaving the building") }
}

class Apartment {
    let unit: String
    weak var tenant: Person?
    
    init(unit: String) { self.unit = unit }
    deinit { print("Apartment \(unit) is now empty.") }
}

do {
    let aungAung = Person(name: "Aung Aung")
    let room101 = Apartment(unit: "101")
    
    aungAung.apartment = room101
    room101.tenant = aungAung
}

// Capture Lists in Closures
class MyController {
    var name = "HomeVC"
    
    lazy var myClosure = { [weak self] in
        print("Running closure for \(self?.name ?? "Unknown")")
    }
}

// Homework
class Singer {
    var name: String
    var song: Song1?
    
    init(name: String) { self.name = name }
    deinit { print("\(name) is being deinitialized") }
}

class Song1 {
    var title: String
    weak var singer: Singer?
    
    init(title: String) { self.title = title }
    deinit { print("\(title) is being deinitialized (Memory freed!)") }
}

do {
    let singer = Singer(name: "Taylor Swift")
    let song1 = Song1(title: "Blank Space")
    
    singer.song = song1
    song1.singer = singer
}
print("")

// Review
// 1. Error Handling
enum ExchangeError: Error {
    case deviceMismatch
    case insufficientCondition(point: Int)
}

// 2. Protocol & Inheritance
class Gadget {
    let model: String
    init(model: String) { self.model = model }
}

class Phone: Gadget {
    var healthScore: Int = 100
}

// 3. Generics
struct ExchangeBox<T: Gadget> {
    var item: T
    
    var isTradeInReady: Bool { return true }
}

// 5. Advanced Enum & Error Handling
enum TradeStatus {
    case pending
    case success(credit: Double)
    case failed(reason: String)
}

class ExchangeManager {
    // 6. Memory Management (ARC)
    weak var partnerStore: ExchangeManager?
    
    func processManager(for device: Phone) throws -> Double {
        if device.healthScore < 50 {
            throw ExchangeError.insufficientCondition(point: device.healthScore)
        }
        return 500.0
    }
}

let myOldPhone = Phone(model: "iPhone 12")
myOldPhone.healthScore = 80

let manager = ExchangeManager()

do {
    let credit = try manager.processManager(for: myOldPhone)
    print("Success! You got $\(credit) credit.")
} catch ExchangeError.insufficientCondition(let point) {
    print("Rejected: Battery score \(point) is too low")
} catch {
    print("Unknown error")
}
