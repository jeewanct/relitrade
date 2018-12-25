//
//  LocateUsCell.swift
//  Relitrade
//
//  Created by Deven on 12/24/18.
//  Copyright © 2018 investwell. All rights reserved.
//

import UIKit

class LocateUsCell: UITableViewCell{
    
    @IBOutlet weak var optionLabel: UILabel!
    @IBOutlet weak var optionImage: UIImageView!
    
    var details: HomeDetailsEntity?{
        didSet{
            optionLabel.text = details?.optionLabel
            optionImage.image = details?.optionImage
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }
}
