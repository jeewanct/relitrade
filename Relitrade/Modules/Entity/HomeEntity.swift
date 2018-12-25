//
//  HomeEntity.swift
//  Relitrade
//
//  Created by Vaibhav Nath on 24/12/18.
//  Copyright © 2018 investwell. All rights reserved.
//

import UIKit

class HomeEntity{
    
    var homeOptions: [HomeDetailsEntity]?
    var connectOptions: [HomeDetailsEntity]?
    var backgroundImage: UIImage?
    var connectBackground: UIColor?
    
}

class HomeDetailsEntity{
    
    var optionImage: UIImage?
    var optionLabel: String?
    
    init(image: UIImage, text: String) {
        self.optionImage = image
        self.optionLabel = text
    }
    
}
