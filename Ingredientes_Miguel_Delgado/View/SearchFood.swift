//
//  ViewController.swift
//  Ingredientes_Miguel_Delgado
//
//  Created by Miguel Angel Delgado Alcantara on 9/11/19.
//  Copyright © 2019 Miguel Angel Delgado Alcantara. All rights reserved.
//

import UIKit

class SearchFood: BaseViewController {
    
    @IBOutlet weak var collectionContainer: UICollectionView!
    
    var food: [Ingredient]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerOfCell()
        collectionContainer.delegate = self
        collectionContainer.dataSource = self
        
    }
    
    
    //MARK: register of cell of collectionView
    func registerOfCell() {
        self.collectionContainer.register(UINib(nibName: "FindFoodCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FindFoodCollectionViewCell")
    }
    
}


// MARK: Delegate of collectionview for fill collectionContainer

extension SearchFood: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return food!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: CGFloat(0),  left: CGFloat(0), bottom: CGFloat(0), right: CGFloat(0))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 97)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FindFoodCollectionViewCell", for: indexPath) as! FindFoodCollectionViewCell
        let foodComplete = food![indexPath.row]
        cell.configCell(foodComplete: foodComplete, indexPath: indexPath.row)
        if indexPath.row % 2 ==  0 {
            /*
             Use the color green and blue because for the food industry they are very important colors in the psychology of color, green stimulates apatite and blue is responsible for only eating what is necessary
             
             */
            cell.viewColor.backgroundColor = UIColor.green
        } else {
            cell.viewColor.backgroundColor = UIColor.blue
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DeatailSearchViewController") as! DeatailSearchViewController
        
        vc.food = food![indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

