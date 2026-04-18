import UIKit

struct Task {
    var name: String
    var isCompleted: Bool
}

class TaskManager {
    var tasks: [Task] = []
    
    func addTask(task: Task) {
        tasks.append(task)
    }
    
    func deleteTask(task: Task) {
        tasks.removeAll(where: { $0.name == task.name })
    }
    
    func showAllTask() {
        for task in tasks {
            print("\(task.name): \(task.isCompleted)")
        }
    }
}

let task1 = Task(name: "Buy milk", isCompleted: false)
let task2 = Task(name: "Buy eggs", isCompleted: true)
let task3 = Task(name: "Buy bread", isCompleted: false)

var taskManager = TaskManager()
taskManager.addTask(task: task1)
taskManager.addTask(task: task2)
taskManager.addTask(task: task3)

taskManager.deleteTask(task: task2)

taskManager.showAllTask()
