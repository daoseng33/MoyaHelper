//
//  MoyaProviderExtension.swift
//  WebAPI
//
//  Created by DAO on 2021/3/30.
//

import Foundation
public import Moya

private func JSONResponseDataFormatter(_ data: Data) -> String {
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData = try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return String(data: prettyData, encoding: .utf8) ?? String(data: data, encoding: .utf8) ?? ""
    } catch {
        return String(data: data, encoding: .utf8) ?? ""
    }
}

extension MoyaProvider {
    public static var `default`: MoyaProvider {
        if APIConfiguration.useMockData {
            return MoyaProvider.stub
        } else {
            let formatter: NetworkLoggerPlugin.Configuration.Formatter = .init(responseData: JSONResponseDataFormatter)
            let configuration: NetworkLoggerPlugin.Configuration = .init(formatter: formatter, logOptions: .verbose)
            let netWorkPlugin: NetworkLoggerPlugin = NetworkLoggerPlugin(configuration: configuration)
            let errorHandlingPlugin: ErrorHandlingPlugin = ErrorHandlingPlugin()
            
            return MoyaProvider<Target>(callbackQueue: .global(),
                                        plugins: [netWorkPlugin, errorHandlingPlugin])
        }
    }
    
    public static var stub: MoyaProvider {
        return MoyaProvider<Target>(stubClosure: MoyaProvider.immediatelyStub)
    }
}
