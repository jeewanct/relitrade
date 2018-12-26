//
//  FutureCalculatorInteractor.swift
//  Relitrade
//
//  Created by Vaibhav Nath on 26/12/18.
//  Copyright © 2018 investwell. All rights reserved.
//

import Foundation

class FutureCalculatorInteractor: PresentorToInterectorProtocol{
    
    var presenter: InterectorToPresenterProtocol?
    
    func fetchData() {
        
    }
    
    func fetchData<T>(data: T) {
        
        guard var information = data as? FutureCalculatorEntity else{ return }
        guard var amount = information.amout else { return }
        guard var months = information.months else { return }
        guard var expected = information.expectedReturn else { return }
        
        var rate = expected / 100
        
        var value = 0.0
        
        for index in 1...months{
            value = value + (pow ( (1 + rate) , Double(index) / 12 ) )
        }
        
        var calculatedValue = round(amount / value)
        
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        currencyFormatter.currencyCode = "INR"
        currencyFormatter.locale = Locale(identifier: "en_IN")
        
        var localizedString = currencyFormatter.currencyCode
        
        var totalInterest = round(calculatedValue * Double(months))
        var doubleApp = round(amount - totalInterest)

        if let currencySign = localizedString{
            
            let outputString = FutureValueCalculateEnum.monthlySip.rawValue + "\(currencySign)\(calculatedValue)\n" + FutureValueCalculateEnum.totalInvestment.rawValue + "\(totalInterest)\n" + FutureValueCalculateEnum.appreciation.rawValue + "\(doubleApp)"
            presenter?.dataFetched(news: outputString)
        }
        
        
        
    }
    
}
