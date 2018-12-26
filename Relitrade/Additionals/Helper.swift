//
//  Helper.swift
//  Relitrade
//
//  Created by Vaibhav Nath on 26/12/18.
//  Copyright © 2018 investwell. All rights reserved.
//

import Foundation

class Helper{
    
    static let shared  = Helper()
    
    func convertToJsonData(data: Data?) -> Data{
        
        guard let convertedString = String(data: data ?? Data(), encoding: .utf8) else {
            return Data()
        }
        
        let jsonResponse = removeString(of: convertedString, startingDeliminator: "<", endingDeliminator: ">")
        
        return Data(jsonResponse.utf8)
        
    }
    
    
    func removeString(of: String, startingDeliminator: Character, endingDeliminator: Character) -> String{
    
        var res = ""
        var count = 0
        for c in of {
            switch c {
            case startingDeliminator: count = count + 1; break;
            case endingDeliminator: count = count - 1; break;
            default:
                if count == 0 {
                    res += String(c)
                }
                break;
            }
        }
        
        return res
        
        
    }
    
}
