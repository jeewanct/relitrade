//
//  HeaderShareCell.swift
//  Relitrade
//
//  Created by Vaibhav Nath on 24/12/18.
//  Copyright © 2018 investwell. All rights reserved.
//

import UIKit

class HeaderShareCell: UICollectionViewCell{
    
    var stockValue: HomeShareEntity?{
        didSet{
            marketName.text = stockValue?.IndexName
            if let currentValue = stockValue?.CurrentVal {
                self.marketCurrentValue.text = String(currentValue)
              
                if currentValue > 0 {
                    self.dropGainImage.image = #imageLiteral(resourceName: "gainInStock")
                    self.marketPercent.textColor = #colorLiteral(red: 0.03137254902, green: 0.4431372549, blue: 0.1294117647, alpha: 1)
                    self.currentChange.textColor = #colorLiteral(red: 0.03137254902, green: 0.4431372549, blue: 0.1294117647, alpha: 1)
                }else{
                    self.dropGainImage.image = #imageLiteral(resourceName: "dropInStock")
                    self.marketPercent.textColor = #colorLiteral(red: 1, green: 0, blue: 0.03921568627, alpha: 1)
                    self.currentChange.textColor = #colorLiteral(red: 1, green: 0, blue: 0.03921568627, alpha: 1)
                }
            }
            
            if let changePer = stockValue?.ChangePer{
                self.marketPercent.text = "(\(changePer)%)"
            }
            
            if let change = stockValue?.Change{
                self.currentChange.text = String(change)
            }
            
            
        }
    
    }
    
    @IBOutlet weak var marketName: UILabel!
    @IBOutlet weak var marketCurrentValue: UILabel!
    @IBOutlet weak var marketPercent: UILabel!
    @IBOutlet weak var dropGainImage: UIImageView!
    @IBOutlet weak var currentChange: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
