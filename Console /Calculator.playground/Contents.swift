import UIKit

// Calculator
func addNumber(num1: Double, num2: Double) -> Double {
    return num1 + num2
}
func subtractNumber(num1: Double, num2: Double) -> Double {
    return num1 - num2
}
func multiplyNumber(num1: Double, num2: Double) -> Double {
    return num1 * num2
}
func divideNumber(num1: Double, num2: Double) -> Double {
    return num1 / num2
}

print(addNumber(num1: 10.0, num2: 5.0))
print(subtractNumber(num1: 100, num2: 50))
print(multiplyNumber(num1: 9, num2: 8))
print(divideNumber(num1: 1, num2: 2))

// Calculate Mark
struct Subject {
    let name: String
    let marks: Int
}

class Student {
    var studentName: String
    var subjects: [Subject]
    
    init(studentName: String, subjects: [Subject]) {
        self.studentName = studentName
        self.subjects = subjects
    }
    
    func totalMarks() -> Int {
        return subjects.reduce(0) { $0 + $1.marks }
    }
}

let student = Student(studentName: "A", subjects: [Subject(name: "Math", marks: 80), Subject(name: "English", marks: 90), Subject(name: "Language", marks: 70)])
print(student.totalMarks())



