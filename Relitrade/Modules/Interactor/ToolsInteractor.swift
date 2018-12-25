//
//  ToolsInteractor.swift
//  Relitrade
//
//  Created by Vaibhav Nath on 24/12/18.
//  Copyright © 2018 investwell. All rights reserved.
//

import Foundation

class ToolsInteractor: PresentorToInterectorProtocol{
    
    
    var presenter: InterectorToPresenterProtocol?
    
    func fetchData() {
        
        let toolsData = [
            HomeDetailsEntity(image: #imageLiteral(resourceName: "homeImage"), text: HomeOptionsEnum.calculateSip.rawValue),
            HomeDetailsEntity(image: #imageLiteral(resourceName: "homeImage"), text: HomeOptionsEnum.sipStepUp.rawValue),
            HomeDetailsEntity(image: #imageLiteral(resourceName: "homeImage"), text: HomeOptionsEnum.calculateFutureValue.rawValue),
            HomeDetailsEntity(image: #imageLiteral(resourceName: "homeImage"), text: HomeOptionsEnum.costOfDelayInSip.rawValue),
            HomeDetailsEntity(image: #imageLiteral(resourceName: "homeImage"), text: HomeOptionsEnum.swpCalculator.rawValue),
            HomeDetailsEntity(image: #imageLiteral(resourceName: "homeImage"), text: HomeOptionsEnum.lumpsumInvestment.rawValue),
            HomeDetailsEntity(image: #imageLiteral(resourceName: "homeImage"), text: HomeOptionsEnum.sipTenure.rawValue),
            HomeDetailsEntity(image: #imageLiteral(resourceName: "homeImage"), text: HomeOptionsEnum.emiCalculator.rawValue),
            HomeDetailsEntity(image: #imageLiteral(resourceName: "homeImage"), text: HomeOptionsEnum.dreamHouse.rawValue),
            HomeDetailsEntity(image: #imageLiteral(resourceName: "homeImage"), text: HomeOptionsEnum.marriageCalculator.rawValue),
            HomeDetailsEntity(image: #imageLiteral(resourceName: "homeImage"), text: HomeOptionsEnum.educationCalculator.rawValue),
            HomeDetailsEntity(image: #imageLiteral(resourceName: "homeImage"), text: HomeOptionsEnum.retirementCalcuator.rawValue)
        ]
        
        presenter?.dataFetched(news: toolsData)

    }
    
    func fetchData<T>(data: T) {
        
    }
    
    
}
