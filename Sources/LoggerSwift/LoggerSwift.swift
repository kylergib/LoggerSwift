

import Foundation

class Logger {
    private var levelDict = ["info": 0, "debug": 1, "warning": 0, "error": 0, "critical": 0, "fatal": 0, "fine": 2, "finer": 3, "finest": 4]
    var currentLevel: String = "info"
    var currentClassName: String
    let formatter = DateFormatter()

    init<T>(current: T) {
        currentClassName = String(describing: current.self)
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    }

    func info(_ message: String, function: String = #function, line: Int = #line) {
        log("ℹ️", message, function: function, line: line)
    }

    func debug(_ message: String, function: String = #function, line: Int = #line) {
        if levelDict[currentLevel]! >= 1 {
            log("🐞", message, function: function, line: line)
        }
    }

    func warning(_ message: String, function: String = #function, line: Int = #line) {

        log("⚠️", message, function: function, line: line)
    }

    func error(_ message: String, function: String = #function, line: Int = #line) {
        log("❌", message, function: function, line: line)
    }

    func critical(_ message: String, function: String = #function, line: Int = #line) {
        log("❗", message, function: function, line: line)
    }

    func fatal(_ message: String, function: String = #function, line: Int = #line) {
        log("☠️", message, function: function, line: line)
    }

    func fine(_ message: String, function: String = #function, line: Int = #line) {
        if levelDict[currentLevel]! >= 2 {
            log("👍", message, function: function, line: line)
        }
    }

    func finer(_ message: String, function: String = #function, line: Int = #line) {
        if levelDict[currentLevel]! >= 3 {
            log("👌", message, function: function, line: line)
        }
    }

    func finest(_ message: String, function: String = #function, line: Int = #line) {
        if levelDict[currentLevel]! >= 4 {
            log("🌟", message, function: function, line: line)
        }
    }

    private func log(_ emoji: String, _ message: String, function: String = #function, line: Int = #line) {

        let currentDate = Date()
        let customFormattedDate = formatter.string(from: currentDate)
        let printString = "\(emoji) [\(customFormattedDate) - \(currentClassName) - \(function) - line \(line)]: \(message)"
        _ = "\(emoji) [\(customFormattedDate) - \(currentClassName)]: \(message)"
        print(printString)
        
    }

    func setLevel(level: String) {
        currentLevel = levelDict.contains(where: { $0.key == level }) ? level : currentLevel
    }

    func getLevel() -> String {
        return currentLevel
    }
}
