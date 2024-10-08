//
//  Logable.swift
//  MobileBackend
//
//  Created by Nick Reichard on 10/7/24.
//

import Foundation
import os

protocol Logable {
    static func logger(category: String) -> Logger
    func notice(string: String)
    func debug(string: String)
    func trace(string: String)
    func info(string: String)
    func error(string: String)
    func warning(string: String)
    func fault(string: String)
    func critical(string: String)
}

func logMe(_ message: String, _ logLevel: Logger.LogLevel, logger: Logable = Logger.logger(category: #fileID)) {
    switch logLevel {
    case .notice:
        logger.notice(string: message)
    case .debug:
        logger.debug(string: message)
    case .trace:
        logger.trace(string: message)
    case .info:
        logger.info(string: message)
    case .error:
        logger.error(string: message)
    case .warning:
        logger.warning(string: message)
    case .fault:
        logger.fault(string: message)
    case .critical:
        logger.critical(string: message)
    }
}

