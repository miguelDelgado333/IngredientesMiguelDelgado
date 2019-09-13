//
//  BaseViewController.swift
//  Ingredientes_Miguel_Delgado
//
//  Created by Miguel Angel Delgado Alcantara on 9/12/19.
//  Copyright © 2019 Miguel Angel Delgado Alcantara. All rights reserved.
//

import UIKit

// MARK: This is where the background is drawn

class BaseViewController: UIViewController {
    
    var contentView: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configBase()
    }
    
    private func configBase() {
        let screenSize: CGRect = UIScreen.main.bounds
        let positionXY = BaseData.positionXYcontentView.rawValue
        let imageBackground = UIImage(named: NameOfImage.imgBackgroundScreen.rawValue)
        contentView = UIImageView(image: imageBackground)
        
        if let content = contentView {
            content.alpha = CGFloat(BaseData.alphaNum.rawValue)
            content.frame = CGRect(x: CGFloat(positionXY), y: CGFloat(positionXY), width: screenSize.width, height: screenSize.height)
            
            self.view.insertSubview(content, at: TableInformationViewData.numeroOfOptional.rawValue)
        }
        
        
    }
    
}

