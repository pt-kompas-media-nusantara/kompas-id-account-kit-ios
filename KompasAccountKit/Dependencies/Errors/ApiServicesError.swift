//
//  ApiServicesError.swift
//  kompasid
//
//  Created by Kompas Digital on 12/05/25.
//

import Foundation
import KompasIdLibrary

enum ApiServicesError: Error, LocalizedError, Equatable {
    case offline
    case rto
    case unauthorized
    case error4xx(code: Int, message: String)
    case error5xx(code: Int, message: String)
    case unknown(message: String)

    static func mapper(error: ResultsError<NetworkError>) -> Self {
        switch error.error {
        case is NetworkError.NoInternet:
            return .offline
        case is NetworkError.RequestTimeout:
            return .rto
        case is NetworkError.Unauthorized:
            return .unauthorized
        case is NetworkError.ServerError:
            return .error5xx(code: 500, message: "Internal Server Error")
        case is NetworkError.NotFound:
            return .error4xx(code: 404, message: "Not Found")
        case let technical as NetworkError.Technical:
            let code = technical.code
            let message = technical.message
            return code >= 500
                ? .error5xx(code: Int(code), message: message)
                : .error4xx(code: Int(code), message: message)
        case let error as NetworkError.Error:
            return .unknown(message: "\(error)")
        default:
            return .unknown(message: "Unknown error")
        }
    }
}
