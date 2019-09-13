//
//  FindHelper.swift
//  Ingredientes_Miguel_Delgado
//
//  Created by Miguel Angel Delgado Alcantara on 9/12/19.
//  Copyright © 2019 Miguel Angel Delgado Alcantara. All rights reserved.
//

import Foundation
import Alamofire

//MARK: FUNCTION FOR CREATE OF SERVICE OF APP

class FindHelper: NSObject {
    
    func getIngredientsHelper(ingredients: String, saucer: String, completionHandler:@escaping(Result<Any>, Int) -> Void) {
        
        let keys: Array<ServiceKey> = [ServiceKey(key: ":ingredients", value: ingredients),
                                       ServiceKey(key: ":food", value: saucer)]
        
        ApiService.shared.makeRequest(with: Router.getIngredients(keys: keys)) { (response, statusCode) in
            if response.isSuccess {
                completionHandler(.success(response.value!), statusCode)
            } else {
                completionHandler(.failure(response.error!), statusCode)
            }
        }
    }
    
}

