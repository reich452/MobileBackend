//
//  Logger+.swift
//  MobileBackend
//
//  Created by Nick Reichard on 10/7/24.
//

import Foundation
import os

extension Logger: Logable {
    
    static func logger(category: String = #fileID) -> Logger {
        let subsystem = Bundle.main.bundleIdentifier ?? "com.MobileBackend.dev"
        let fileName = category.components(separatedBy: "/").last ?? category
        return Logger(subsystem: subsystem, category: fileName)
    }
    
    // Enum for log levels
    enum LogLevel {
        case notice, debug, trace, info, error, warning, fault, critical
    }
    
    // Custom logging functions with emojis
    func notice(string: String) {
        notice("\(emoji(for: .notice)) \(string)\n Thread: \(Thread.current.threadName)")
    }
    
    func debug(string: String) {
        debug("\(emoji(for: .debug)) \(string)\n Thread: \(Thread.current.threadName)")
    }
    
    func trace(string: String) {
        trace("\(emoji(for: .trace)) \(string)\n Thread: \(Thread.current.threadName)")
    }
    
    func info(string: String) {
        info("\(emoji(for: .info)) \(string)\n Thread: \(Thread.current.threadName)")
    }
    
    func error(string: String) {
        error("\(emoji(for: .error)) \(string)\n Thread: \(Thread.current.threadName)")
    }
    
    func warning(string: String) {
        warning("\(emoji(for: .warning)) \(string)\n Thread: \(Thread.current.threadName)")
    }
    
    func fault(string: String) {
        fault("\(emoji(for: .fault)) \(string)\n Thread: \(Thread.current.threadName)")
    }
    
    func critical(string: String) {
        critical("\(emoji(for: .critical)) \(string)\n Thread: \(Thread.current.threadName)")
    }
    
    // Helper function to return emoji based on log level
    private func emoji(for level: LogLevel) -> String {
        switch level {
        case .notice:
            return "🔔"
        case .debug:
            return "🐛"
        case .trace:
            return "🧵"
        case .info:
            return "ℹ️"
        case .error:
            return "❗️"
        case .warning:
            return "⚠️"
        case .fault:
            return "🔥"
        case .critical:
            return "🚨"
        }
    }
}

private extension Thread {
    
    var threadName: String {
        if isMainThread {
            return "Main"
        } else if let threadName = Thread.current.name, !threadName.isEmpty {
            return threadName
        } else {
            return description
        }
    }
}
