//
//  FutureCalculatorEntity.swift
//  Relitrade
//
//  Created by Vaibhav Nath on 26/12/18.
//  Copyright © 2018 investwell. All rights reserved.
//

import Foundation


class FutureCalculatorEntity{
    
    var amout: Double?
    var years: Int?
    var expectedReturn: Double?
    var months: Int?
    var outputString: String?
    
    init(amount: String?, years: String?, expectedReturn: String? ) {
        
        if let unwrappedAmount = amount,let unwrappedYears = years,let unwrappedExpected = expectedReturn{
            
            if let doubleAmount = Double(unwrappedAmount){
                self.amout = doubleAmount
            }
            
            if let doubleExpected = Double(unwrappedExpected){
                self.expectedReturn = doubleExpected
            }
            
            if let IntYears = Int(unwrappedYears){
                self.years = IntYears
                self.months = IntYears * 12
            }
            
        }
        
    }
    
}
