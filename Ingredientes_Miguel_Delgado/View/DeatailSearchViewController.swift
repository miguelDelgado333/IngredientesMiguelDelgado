//
//  DeatailSearchViewController.swift
//  Ingredientes_Miguel_Delgado
//
//  Created by Miguel Angel Delgado Alcantara on 9/13/19.
//  Copyright © 2019 Miguel Angel Delgado Alcantara. All rights reserved.
//

import UIKit

class DeatailSearchViewController: BaseViewController {
    
    @IBOutlet weak var imgContainer: UIImageView!
    @IBOutlet weak var lbIngredients: UILabel!
    
    var food: Ingredient?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCell()
        // Do any additional setup after loading the view.
    }
    
    func configCell() {
        lbIngredients.text = food?.ingredients
        
        guard let image = food?.thumbnail, image != ""  else {
            return imgContainer.image = UIImage(named: "food-1")
        }
        self.imgContainer.downloaded(from: image)
        
    }
    
}
