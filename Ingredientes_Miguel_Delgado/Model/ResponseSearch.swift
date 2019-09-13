//
//  ResponseSearch.swift
//  Ingredientes_Miguel_Delgado
//
//  Created by Miguel Angel Delgado Alcantara on 9/12/19.
//  Copyright © 2019 Miguel Angel Delgado Alcantara. All rights reserved.
//

import Foundation
import ObjectMapper

//MARK: MODEL OF WEB SERVICE FOR RESPONSE

struct ResponseSearch: Mappable  {
    var title: String
    var version: Int
    var href: String
    var result: [Ingredient]?
    
    init?(map: Map) {
        title = String()
        version = Int()
        href = String()
    }
    
    mutating func mapping(map: Map) {
        self.title <- map["title"]
        self.version <- map["version"]
        self.href <- map["href"]
        self.result <- map["results"]
    }
}

struct Ingredient: Mappable {
    var title: String
    var href: String
    var ingredients: String
    var thumbnail: String?
    
    init?(map: Map) {
        title = String()
        href = String()
        ingredients = String()
        thumbnail = String()
    }
    
    mutating func mapping(map: Map) {
        self.title <- map["title"]
        self.href <- map["href"]
        self.ingredients <- map["ingredients"]
        self.thumbnail <- map["thumbnail"]
    }
}
