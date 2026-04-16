import UIKit

// Variable, Constant & Data Types
// String
let developerName: String = "Kiyotaka Kirito"
var currentMode: String = "Boredom"
currentMode = "Excited and ready to code!"

// Int & Double
let birthYear: Int = 1998
var age: Int = 27

let piValue: Double = 3.14159
var bankBalance: Double = 0.0

// Bool
var isHungry: Bool = false
var hasMacbookM2Pro: Bool = true

let introduction = "Hello, my name is \(developerName). I'm \(age) years old and my bank balance is $\(bankBalance)"
print(introduction)
print("")

// Operators
let itemOneName = "Coffee Beans"
let itemOnePrice: Double = 12.50
var itemOneQuantity = 2

let itemTwoName = "Milk"
let itemTwoPrice: Double = 3.25
var itemTwoQuantity = 1

let itemOneTotal = itemOnePrice * Double(itemOneQuantity)
let itemTwoTotal = itemTwoPrice * Double(itemTwoQuantity)

let subTotal = itemOneTotal + itemTwoTotal
let taxRate = 0.05
let taxAmount = subTotal * taxRate
let finalTotal = subTotal + taxAmount

let isBudgetExceeded = finalTotal > 30.0
let discountAvailable = itemOneQuantity >= 2

let receiptHeader = "--- SWEET CAFE RECEIPT ---"
let itemRow1 = "\(itemOneName) x \(itemOneQuantity): $\(itemOneTotal)"
let itemRow2 = "\(itemTwoName) x \(itemTwoQuantity): $\(itemTwoTotal)"

let summary = """
--------------------------
Subtotal: $\(subTotal)
Tax (5%): $\(taxAmount)
TOTAL: $\(finalTotal)
--------------------------
Budget Exceeded? : \(isBudgetExceeded)
Got Discount? : \(discountAvailable)
"""

print(receiptHeader)
print(itemRow1)
print(itemRow2)
print(summary)

// Homework
// let itemTotal = itemOnePrice * itemOneQuantity // Date type error
let remainder = 11 % 3
print("Remainder: \(remainder)")

var score = 10
score += 5 // score = score + 5
print("Score: \(score)")
print("")

// Logic & Decisions
let hasCorrectPasscode = true
let isDoorBloacked = false
let timeOfDay = 22
let userRole = "Admin"

print("--- Security Check ---")
if hasCorrectPasscode && !isDoorBloacked {
    print("Welcome home! Door is unlocked.")
} else if isDoorBloacked {
    print("Error: Something is blocking the door!")
} else {
    print("Access Denied: Incorrect passcode.")
}

if timeOfDay >= 22 || timeOfDay <= 5 {
    print("Night Mode Active: Motion sensors are ON.")
}

switch userRole {
case "Admin":
    print("Access Level: Full Access Granted.")
case "Guest":
    print("Access Level: Limited Access. Please stay in the living room.")
case "Unknown":
    print("Access Level: No Access. Calling the owner...")
default:
    print("Invalid Role.")
}

// Homework
var developerAge = 30
var hasStudentCard = false

if developerAge > 60 {
    print("Senior Discount (50%)")
} else if developerAge >= 18 && developerAge <= 60 && hasStudentCard {
    print("Student Discount (20%)")
} else if !hasStudentCard {
    print("Standard Price")
} else if developerAge < 18 {
    print("Minor Discount (20%)")
}
print("")

// Loop
print("--- Apple Watch Fitness Tracker ---")

// For-In Loop
print("[Starting Daily Walk]")
let stepGoal = 5

for step in 1...stepGoal {
    print("Step taken: \(step)")
}
print("Goal Reached: All \(stepGoal) steps completed!")

// While Loop
print("\n[Starting Workout: Treadmill]")
var burnedCalories = 0
let targetCalories = 150

while burnedCalories < targetCalories {
    print("Running... Current calories burned: \(burnedCalories)")
    burnedCalories += 50
}
print("Workout Complete! Total burned: \(burnedCalories) calories.")

// Repeat-While Loop
print("\n[Cool Down Stretch]")
var stretchCount = 0

repeat {
    stretchCount += 1
    print("Stretching time: \(stretchCount)")
} while stretchCount < 3
print("Track Finished")

// Homework
print("\n[Countdown]")
var countdown = 10

for count in (1...countdown).reversed() {
    print("Countdown Timer: \(count)")
}
print("Happy New Year!")
print("")

// Array & Dictionaries
// Array
print("--- 1. Arrays (Music Playlist) ---")
var  playlist: [String] = ["Shape Of You", "Blank Space", "Perfect"]

print("First song: \(playlist[0])")
print("Second song: \(playlist[1])")

playlist.append("Bad Habits")
print("After added new song: \(playlist)")

playlist.remove(at: 1)
print("After removed song: \(playlist)")

let totalSongs = playlist.count
print("Total songs: \(totalSongs)")

// Dictionaries
print("\n--- 2. Dictionaries (Contact Book) ---")
var phoneBook: [String: String] = [
    "Steve Jobs": "555-0100",
    "Tim Cook": "555-0200"
]

let timNumber = phoneBook["Tim Cook", default: "Number Not Found"]
print("Tim Cook's phone number: \(timNumber)")

phoneBook["Craig"] = "555-0300"
phoneBook["Tim Cook"] = "555-9999"
phoneBook["Steve Jobs"] = nil // if value is nil, auto delete
print("Update phone book: \(phoneBook)")

// Homework
print("\n--- Shopping Cart ---")
var shoppingCart: [String] = ["Milk", "Eggs", "Bread", "Coffee"]

for item in shoppingCart {
    print("Item: \(item)")
}
print("")

// Sets
var attendees: Set<String> = ["Aung Aung", "Su Su", "Kyaw Kyaw", "Aung Aung"]
print("Attendees: \(attendees)")

// Set Operations
let swiftClass: Set = ["Aung Aung", "Su Su", "Kyaw Kyaw"]
let iOSClass: Set = ["Kyaw Kyaw", "Mya Mya", "Bo Bo"]

// Interaction: finding common ground betweem two sets
let bothClasses = swiftClass.intersection(iOSClass)
print("Both Classes: \(bothClasses)")

// Union: adding two sets
let allStudents = swiftClass.union(iOSClass)
print("All Students: \(allStudents)")

// Homework
let menuItems: [String] = ["Burger", "Sandwish", "Salad"]
let itemPrices: [String: Double] = [
    menuItems[0]: 2.50,
    menuItems[1]: 5.00,
    menuItems[2]: 7.25
]

for (item, price) in itemPrices {
    print("Item: \(item), Price: \(price)")
}

let orderedItems: Set<String> = ["Burger", "Sandwish", "Salad", "Sandwish"]
print("OrderedItems: \(orderedItems)")
print("")

// Review
// 1. Constans & Variables
let storeName = "Apple Tech Store"
var totalSales: Double = 0.0

// 2. Collections
var inventoryArray = ["iPhone 15", "MacBook M2", "iPad Pro", "AirPods"]
let priceDict = ["iPhone 15": 999.0, "MacBook M2": 1299.0, "iPad Pro": 799.0, "AirPods": 249.0]
var categoriesSet: Set = ["Electronics", "Computers", "Audio"]

// 3. Loops & Logic
print("--- Welcome to \(storeName) ---")
for item in inventoryArray {
    // Get price form dictionary
    if let price = priceDict[item] {
        print("Product: \(item) | Price: $\(price)")
        
        // 4. Operations
        if item == "MacBook M2" {
            print(">> Special Promo: 10% Discount on \(item)!")
            let discountPrice = price * 0.09
            totalSales += discountPrice
        } else {
             totalSales += price
        }
    }
}

// 5. Final Summary
print("\n--- Sales Report ---")
print("Total potential revenue from one of each item: $\(totalSales)")
print("Unique Categories: \(categoriesSet.count)")
