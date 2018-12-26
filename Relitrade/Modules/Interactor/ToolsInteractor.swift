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
            HomeDetailsEntity(image: #imageLiteral(resourceName: "homeImage"), text: HomeOptionsEnum.calculateSip.rawValue, type: HomeOptionsEnum.calculateSip),
            HomeDetailsEntity(image: #imageLiteral(resourceName: "homeImage"), text: HomeOptionsEnum.sipStepUp.rawValue, type: HomeOptionsEnum.sipStepUp),
            HomeDetailsEntity(image: #imageLiteral(resourceName: "homeImage"), text: HomeOptionsEnum.calculateFutureValue.rawValue, type: HomeOptionsEnum.calculateFutureValue),
            HomeDetailsEntity(image: #imageLiteral(resourceName: "homeImage"), text: HomeOptionsEnum.costOfDelayInSip.rawValue, type: HomeOptionsEnum.costOfDelayInSip),
            HomeDetailsEntity(image: #imageLiteral(resourceName: "homeImage"), text: HomeOptionsEnum.swpCalculator.rawValue, type: HomeOptionsEnum.swpCalculator),
            HomeDetailsEntity(image: #imageLiteral(resourceName: "homeImage"), text: HomeOptionsEnum.lumpsumInvestment.rawValue, type: HomeOptionsEnum.lumpsumInvestment),
            HomeDetailsEntity(image: #imageLiteral(resourceName: "homeImage"), text: HomeOptionsEnum.sipTenure.rawValue, type: HomeOptionsEnum.sipTenure),
            HomeDetailsEntity(image: #imageLiteral(resourceName: "homeImage"), text: HomeOptionsEnum.emiCalculator.rawValue, type: HomeOptionsEnum.emiCalculator),
            HomeDetailsEntity(image: #imageLiteral(resourceName: "homeImage"), text: HomeOptionsEnum.dreamHouse.rawValue, type: HomeOptionsEnum.dreamHouse),
            HomeDetailsEntity(image: #imageLiteral(resourceName: "homeImage"), text: HomeOptionsEnum.marriageCalculator.rawValue, type: HomeOptionsEnum.marriageCalculator),
            HomeDetailsEntity(image: #imageLiteral(resourceName: "homeImage"), text: HomeOptionsEnum.educationCalculator.rawValue, type: HomeOptionsEnum.educationCalculator),
            HomeDetailsEntity(image: #imageLiteral(resourceName: "homeImage"), text: HomeOptionsEnum.retirementCalcuator.rawValue, type: HomeOptionsEnum.retirementCalcuator)
        ]
        
        presenter?.dataFetched(news: toolsData)

    }
    
    func fetchData<T>(data: T) {
        
    }
    
    
}
