//
//  Router.swift
//  Ingredientes_Miguel_Delgado
//
//  Created by Miguel Angel Delgado Alcantara on 9/12/19.
//  Copyright © 2019 Miguel Angel Delgado Alcantara. All rights reserved.
//

/*
 Construccion of url and remplace key for value
 */

import Foundation
import Alamofire

struct ServiceKey {
    var key:String = ""
    var value:String = ""
}

enum ServiceEndPoint : String {
    case findFood = "i=:ingredients&q=:food&p=3"//:page"
}

enum ServiceExternal: String {
    case local = "http://www.recipepuppy.com/api/?"
}

enum Router : URLRequestConvertible {
    case getIngredients(keys: Array<ServiceKey>)
    
    func asURLRequest() throws -> URLRequest {
        var method : HTTPMethod {
            return .get
        }
        
        let p : (Array<ServiceKey>) = {
            switch self {
            case .getIngredients(let keyCorrect):
                return keyCorrect
            }
        } ()
        
        var urlString: String = ""
        urlString = "\(ServiceExternal.local.rawValue)\(ServiceEndPoint.findFood.rawValue)"
        
        for key in p {
            urlString = urlString.replacingOccurrences(of: key.key, with: key.value)
        }
        
        let url = URL(string: urlString)
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = method.rawValue
        let encoding = JSONEncoding.default
        return try encoding.encode(urlRequest)
        
    }
}



