//
//  Logger.swift
//  Kompas.id
//
//  Created by Azura Sakan Taufik on 04/01/23.
//

import Foundation
import os.log
import SwiftUI

typealias OSLogger = os.Logger

// MARK: - LoggerType
enum LoggerType: String {
    case info = "🔵 INFO"
    case error = "🔴 ERROR"
    case warning = "🟡 WARNING"
    case debug = "🟢 DEBUG"
    case notification = "⚪️ NOTIFICATION"
    case url = "🟠 URL"
    case response = "🟣 RESPONSE"
    case debugTracker = "🎯 EVENT TRACKER"
}

// MARK: - LoggerTypeV2
enum LoggerTypeV2: String {
    case info = "INFO"
    case error = "ERROR"
    case warning = "WARNING"
    case debug = "DEBUG"
    case notification = "NOTIFICATION"
    case url = "URL"
    case response = "RESPONSE"
    case debugTracker = "EVENT TRACKER"
}

extension OSLogger {
    /// Using your bundle identifier is a great way to ensure a unique identifier.
    private static var subsystem = Bundle.main.bundleIdentifier!

    /// Logs the view cycles like a view that appeared.
    static let print = OSLogger(subsystem: subsystem, category: "print")

    /// Logs the view cycles like a view that appeared.
    static let logger = OSLogger(subsystem: subsystem, category: "logger")

    /// All logs related to tracking and analytics.
    static let statistics = OSLogger(subsystem: subsystem, category: "statistics")
}

// MARK: - Logger
enum Logger {
    static func info(_ messages: Any?..., file: String = #file, function: String = #function, line: Int = #line) {
        self.printMessage(messages, state: .info, file: file, function: function, line: line)
    }

    static func error(_ error: Error? = nil, _ messages: Any?..., file: String = #file, function: String = #function, line: Int = #line) {
        self.printMessageError(error, messages, state: .error, file: file, function: function, line: line)
    }

    static func warning(_ messages: Any?..., file: String = #file, function: String = #function, line: Int = #line) {
        self.printMessage(messages, state: .warning, file: file, function: function, line: line)
    }

    static func debug(_ messages: Any?..., file: String = #file, function: String = #function, line: Int = #line) {
        self.printMessage(messages, state: .debug, file: file, function: function, line: line)
    }

    static func notification(_ messages: Any?..., file: String = #file, function: String = #function, line: Int = #line) {
        self.printMessage(messages, state: .notification, file: file, function: function, line: line)
    }

    static func response(_ messages: Any?..., file: String = #file, function: String = #function, line: Int = #line) {
        self.printMessage(messages, state: .response, file: file, function: function, line: line)
    }

    static func url(_ messages: Any?..., file: String = #file, function: String = #function, line: Int = #line) {
        self.printMessage(messages, state: .url, file: file, function: function, line: line)
    }

    /// "🎯 EVENT TRACKER"
    static func debugTracker(_: Any?..., file _: String = #file, function _: String = #function, line _: Int = #line) {
        //        self.dumpResponse(messages, state: .debugTracker, file: file, function: function, line: line)
    }

    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }()

    private static func printMessage(_ messages: Any?..., state: LoggerTypeV2, file: String, function: String, line: Int) {
        #if DEBUG

            if state == .url {
                OSLogger.logger.info("\(self.loggerByDev(state: state)) \(messages)")
            } else if state == .response {
                OSLogger.logger.debug("\(self.loggerByDev(state: state)) \(self.sourceFileName(file)).\(function):\(line) \(messages)")
            } else if state == .error {
                OSLogger.logger.critical("\(self.loggerByDev(state: state)) \(self.sourceFileName(file)).\(function):\(line) \(messages)")
            } else if state == .warning {
                OSLogger.logger.warning("\(self.loggerByDev(state: state)) \(self.sourceFileName(file)).\(function):\(line) \(messages)")
            } else if state == .info {
                OSLogger.logger.info("\(self.loggerByDev(state: state)) \(self.sourceFileName(file)).\(function):\(line) \(messages)")
            } else {
                OSLogger.logger.debug("\(self.loggerByDev(state: state)) \(self.sourceFileName(file)).\(function):\(line) \(messages)")
            }
        #endif
    }

    private static func printMessageError(_ error: Error?, _ messages: Any?..., state: LoggerTypeV2, file: String, function: String, line: Int) {
        OSLogger.logger.critical("\(self.loggerByDev(state: state)) \(self.sourceFileName(file)).\(function):\(line) \(messages)")
    }

    private static func loggerByDev(state: LoggerTypeV2) -> String {
        switch state {
        case .info:
            return "🔴 INFO : "
        case .error:
            return "🟠 ERROR : "
        case .warning:
            return "🟡 WARNING : "
        case .debug:
            return "🟢 DEBUG : "
        case .notification:
            return "🔵 NOTIFICATION : "
        case .url:
            return "🟣 URL : "
        case .response:
            return "⚪️ RESPONSE : "
        case .debugTracker:
            return "🟤 TRACKER : "
        }
    }

    private static func dumpResponse(_ response: Any?..., state: LoggerType, file: String, function: String, line: Int) {
        var output = ""
        let dateString = self.dateFormatter.string(from: Date())
        dump(response, to: &output, name: "🔹 \(dateString) - \(state.rawValue) \(self.sourceFileName(file)).\(function):\(line)")
        OSLogger.logger.debug("\(output)")
    }

    private static func sourceFileName(_ filePath: String) -> String {
        let components = filePath.components(separatedBy: "/")
        return components.isEmpty ? "" : (components.last ?? "")
    }
}
