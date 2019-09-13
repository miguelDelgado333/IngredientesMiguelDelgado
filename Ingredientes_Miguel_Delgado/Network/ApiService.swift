//
//  ApiService.swift
//  Ingredientes_Miguel_Delgado
//
//  Created by Miguel Angel Delgado Alcantara on 9/12/19.
//  Copyright © 2019 Miguel Angel Delgado Alcantara. All rights reserved.



/*
 This swift is for detected if is correct a response or is bad
 if correct when statuscode is 200, if is diferent a 200 is bad request o not found
 the consumption of ws is with Alamofire
 */

import Foundation
import Alamofire


enum ApiServiceError : Error {
    case network(error: Error)
    case notFound(reason: String)
}

public enum HttpStatusCode: Int {
    case OK = 200
    case NOT_FOUND = 404
    case BAD_REQUEST = 400
}

class ApiService {
    
    static let shared = ApiService()
    
    private init() {}
    
    func makeRequest(with router: URLRequestConvertible, completionHandler:@escaping(Result<Any>, Int)-> Void) {
        
        Alamofire.request(router).responseJSON { (response) in
            
            guard response.result.error == nil else {
                completionHandler(.failure(ApiServiceError.network(error: response.result.error!)), 1000)
                return
            }
            
            switch(response.response?.statusCode) {
            case HttpStatusCode.OK.rawValue:
                completionHandler(.success(response.value!), HttpStatusCode.OK.rawValue)
                break
            case HttpStatusCode.BAD_REQUEST.rawValue:
                completionHandler(.failure(ApiServiceError.notFound(reason: "BAD REQUEST")), HttpStatusCode.BAD_REQUEST.rawValue)
                break
            case HttpStatusCode.NOT_FOUND.rawValue:
                completionHandler(.failure(ApiServiceError.notFound(reason: "NOT FOUND")), HttpStatusCode.NOT_FOUND.rawValue)
            default:
                completionHandler(.failure(ApiServiceError.notFound(reason: "ERROR INESPERADO")), HttpStatusCode.NOT_FOUND.rawValue )
            }
        }
    }
}
