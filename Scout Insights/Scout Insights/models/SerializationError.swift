//
//  SerializationError.swift
//  Scout Insights
//
//  Created by Samuel Proulx on 2022-04-03.
//

import Foundation

enum SerializationError: Error {
    case generic
    case missing(String)
    case invalid(String, Any)
}
