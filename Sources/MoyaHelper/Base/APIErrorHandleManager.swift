//
//  APIErrorHandleManager.swift
//  WebAPI
//
//  Created by DAO on 2024/9/2.
//

import Foundation
import Combine
import Moya

public class APIErrorHandleManager: @unchecked Sendable {
    public static let shared = APIErrorHandleManager()
    
    public let httpErrorHandler = PassthroughSubject<Int, Never>()
    public let requestErrorHandler = PassthroughSubject<Error, Never>()
    
    private init() {}
}


