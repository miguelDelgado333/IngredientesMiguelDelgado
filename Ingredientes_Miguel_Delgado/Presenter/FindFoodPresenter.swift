//
//  FindFoodPresenter.swift
//  Ingredientes_Miguel_Delgado
//
//  Created by Miguel Angel Delgado Alcantara on 9/12/19.
//  Copyright © 2019 Miguel Angel Delgado Alcantara. All rights reserved.
//

import Foundation
import ObjectMapper

protocol FindFoodPresenterDelegate: AnyObject {
    func searchFood(food: [Ingredient])
    func error(error: String)
}

class FindFoodPresenter {
    
    weak private var delegate: FindFoodPresenterDelegate?
    private let findHelper: FindHelper
    private var responseInfo: ResponseSearch?
    
    init(delegate: FindFoodPresenterDelegate) {
        self.delegate = delegate
        self.findHelper = FindHelper()
    }
    
    func getIngredients(with ingredients: String, saucer: String) {
        findHelper.getIngredientsHelper(ingredients: ingredients, saucer: saucer) { (response, statusCode) in
            if response.isSuccess {
                if let json = response.value! as? [String: Any] {
                    if let responseLoans = ResponseSearch(JSON: json) {
                        if statusCode == HttpStatusCode.OK.rawValue {
                            self.delegate?.searchFood(food: responseLoans.result!)
                        } else if statusCode == HttpStatusCode.BAD_REQUEST.rawValue {
                            self.delegate?.error(error: "BAD REQUEST")
                        }
                    }
                }
            } else {
                self.delegate?.error(error: "OCURRIO UN PROBLEMA")
            }
        }
    }
    
    
    
}
