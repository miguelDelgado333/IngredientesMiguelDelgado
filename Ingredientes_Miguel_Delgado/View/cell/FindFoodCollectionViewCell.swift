//
//  FindFoodCollectionViewCell.swift
//  Ingredientes_Miguel_Delgado
//
//  Created by Miguel Angel Delgado Alcantara on 9/12/19.
//  Copyright © 2019 Miguel Angel Delgado Alcantara. All rights reserved.
//

import UIKit
import SafariServices


class FindFoodCollectionViewCell: UICollectionViewCell, UITextViewDelegate {
    @IBOutlet weak var imgFood: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var textViewLink: UITextView!
    @IBOutlet weak var viewColor: UIView!
    
    // var arrayImageName: [ImageUser]? = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textViewLink.delegate = self
        // Initialization code
    }
    
    func configCell(foodComplete: Ingredient, indexPath: Int) {
        lbName.text = foodComplete.title
        let string = foodComplete.href
        let attributedString = NSMutableAttributedString(string: string, attributes:[NSAttributedString.Key.link: URL(string: foodComplete.href)!])
        textViewLink.delegate = self
        textViewLink.attributedText = attributedString
        textViewLink.isUserInteractionEnabled = true
        textViewLink.isEditable = false
        
        guard let image = foodComplete.thumbnail, image != ""  else {
            return imgFood.image = UIImage(named: "food-1")
        }
        DispatchQueue.main.async {
            self.imgFood.downloaded(from: image)
        }
        
    }
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        let strURL = NSURL(string: textView.text)
        let svc = SFSafariViewController(url: strURL! as URL)
        self.window?.rootViewController!.present(svc, animated: true, completion: nil)
        return false
    }
    
}
