//
//  FindFoodViewController.swift
//  Ingredientes_Miguel_Delgado
//
//  Created by Miguel Angel Delgado Alcantara on 9/12/19.
//  Copyright © 2019 Miguel Angel Delgado Alcantara. All rights reserved.
//

import UIKit

/*
 Do it separately since the logic that must be done to detect if it is an ingredient or dish should go back because if we pass this to a production case and we have that logic we will have to make the change and then go back to upload the app and equal for Android then the right thing is to have this logic in the back part so that in this way only the change is made in the back and it is transparent for the apps and the service is developed so that it is done separately.
 */

class FindFoodViewController: BaseViewController {
    @IBOutlet weak var txfIngredients: UITextView!
    @IBOutlet weak var txfSaurce: UITextView!
    @IBOutlet weak var btoSearch: UIButton!
    
    
    @IBAction func btoSearch(_ sender: Any) {
        var starIngredients = txfIngredients.text
        var starSource = txfSaurce.text
        /*
         MARK: CHECK STRINGS OF TEXTVIEW WITHOUT SPACE AND SPECIAL CHARACTERS
         */
        
        if starIngredients!.contains(" ") {
            starIngredients = starIngredients!.replacingOccurrences(of: " ", with: ",")
        }
        if starSource!.contains(" ") {
            starSource = starSource!.replacingOccurrences(of: " ", with: ",")
        }
        
        let ingredient = starIngredients!.stripped
        let saucer = starSource!.stripped
        
        // WEB SERVICE OF SEARCH FOOD
        presenter?.getIngredients(with: ingredient.trimmingCharacters(in: .whitespaces) , saucer: saucer.trimmingCharacters(in: .whitespaces))
    }
    
    private var presenter: FindFoodPresenter?
    override func viewDidLoad() {
        super.viewDidLoad()
        configScreen()
        self.presenter = FindFoodPresenter(delegate: self)
    }
    
    func configScreen() {
        btoSearch.layer.cornerRadius = 5
        btoSearch.layer.borderWidth = 1
        btoSearch.layer.borderColor = UIColor.clear.cgColor
    }
    
}

extension FindFoodViewController: FindFoodPresenterDelegate {
    func searchFood(food: [Ingredient]) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SearchFood") as! SearchFood
        vc.food = food
        navigationController?.pushViewController(vc, animated: true)
    }
    func error(error: String) {
        print(error)
    }
}
