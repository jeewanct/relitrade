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
    var stockValue : [HomeShareEntity]?
    
}

class HomeDetailsEntity{
    
    var optionImage: UIImage?
    var optionLabel: String?
    var type: HomeOptionsEnum?
    
    init(image: UIImage, text: String,type: HomeOptionsEnum?) {
        self.optionImage = image
        self.optionLabel = text
        self.type = type
    }
    
}

class HomeShareEntity: Codable{
    
    var IndexName: String?
    var CurrentVal: Double?
    var PrevClose: Double?
    var Change: Double?
    var ChangePer: Double?
}
