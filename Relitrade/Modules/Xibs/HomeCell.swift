//
//  HomeCell.swift
//  Relitrade
//
//  Created by Vaibhav Nath on 24/12/18.
//  Copyright © 2018 investwell. All rights reserved.
//

import UIKit

class HomeCell: UICollectionViewCell{
    
    @IBOutlet weak var optionImage: UIImageView!
    @IBOutlet weak var optionLabel: UILabel!
    
    var details: HomeDetailsEntity?{
        didSet{
            optionImage.image = details?.optionImage
            optionLabel.text = details?.optionLabel
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
