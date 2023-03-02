//
//  VerbosePlugin.swift
//  DJoin
//
//  Created by Saran Nonkamjan on 19/2/2566 BE.
//  Copyright © 2566 BE Saran Nonkamjan. All rights reserved.
//

import Foundation
import Moya

struct VerbosePlugin: PluginType {
    let verbose: Bool

    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
#if DEBUG
        if let body = request.httpBody,
           let str = String(data: body, encoding: .utf8) {
            if verbose {
                print("request to send: \(str))")
            }
        }
#endif
        return request
    }

    func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
#if DEBUG
        switch result {
            case .success(let body):
                if verbose {
                    print("Response:")
                    print(body.request?.description ?? "response.url")
                    print(body.request?.httpMethod ?? "response.medthod")
                    print(body.statusCode)
                    print(body.request?.allHTTPHeaderFields ?? [:])
                    print(String(data: body.request?.httpBody ?? .init(), encoding: .utf8) ?? "response.body")

                    if let json = try? JSONSerialization.jsonObject(with: body.data, options: .mutableContainers) {
                        print(json)
                    } else {
                        let response = String(data: body.data, encoding: .utf8)!
                        print(response)
                    }
                }
            case .failure( let error):
                if verbose {
                    print("Error Response:")
                    print(error.response?.request?.description ?? "response.url")
                    print(error.response?.request?.httpMethod ?? "response.medthod")
                    print(error.response?.statusCode ?? 9999)
                    print(error.response?.request?.allHTTPHeaderFields ?? [:])
                    print(String(data: error.response?.request?.httpBody ?? .init(), encoding: .utf8) ?? "response.body")

                    if let json = try? JSONSerialization.jsonObject(with: error.response?.data ?? Data(), options: .mutableContainers) {
                        print(json)
                    } else {
                        let response = String(data: error.response?.data ?? Data(), encoding: .utf8)!
                        print(response)
                    }
                }
        }
#endif
    }
}
