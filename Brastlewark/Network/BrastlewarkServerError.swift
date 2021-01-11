//
//  BrastlewarkServerError.swift
//  Brastlewark
//
//  Created by Eduardo García González on 10/01/21.
//

import Foundation

enum BrastlewarkServerError: LocalizedError {
    case parseError
    case invalidURL
    case serverError(ServerErrorModel?)
    
    var errorDescription: String? {
        switch self {
        case .parseError:
            return "Parse Error"
        case .invalidURL:
            return "Invalid URL"
        case .serverError(let model):
            if let reason = model?.reason {
                return reason
            }
            return "Server Error"
        }
    }
}
