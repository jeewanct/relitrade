//
//  Enums.swift
//  Relitrade
//
//  Created by Vaibhav Nath on 24/12/18.
//  Copyright © 2018 investwell. All rights reserved.
//

import UIKit

enum HomeOptionsEnum: String{
    case portfolioLogin = "Portfolio Login"
    case topSchemes = "Top Schemes"
    case fundPicks = "Fund Picks"
    case tools = "Tools"
    case nfo = "NFO"
    case latestNav = "Latest NAV"
    case knowledgeArea = "Knowledge Area"
    case about = "About"
    case locateUs = "Locate Us"
    
    // Tools options
    
    case calculateSip = "Calculate SIP"
    case sipStepUp = "SIP Step Up Calculator"
    case calculateFutureValue = "Calculate Future Value"
    case costOfDelayInSip = "Cost of delay in SIP"
    case swpCalculator = "SWP Calculator"
    case lumpsumInvestment = "Lumpsum Investment"
    case sipTenure = "SIP Tenure"
    case emiCalculator = "EMI Calculator"
    case dreamHouse = "Dream House"
    case marriageCalculator = "Marriage Calculator"
    case educationCalculator = "Education Calculator"
    case retirementCalcuator = "Retirement Calculator"
}

enum SocialOptionEnum: String{
    
    case callNow = "Call Now"
    case message = "Message"
    case email = "Email"
    case whatsapp = "Whatsapp"
    case share = "Share"
    
}


enum LocateUsEnum: String{
    
    case address = "B/609, MONDEAL SQUARE, NEAR PRAHLAD NAGAR GARDEN,S G HIGHWAY, SATELLITE, AHMEDABAD, 380015"
    case phoneNumber = "+91 8690095500"
    case email = "relimutualfund@relitrade.in"
    case wesite = "www.relimutualfund.com"
    case companyName = "Relitrade Stock Broking Pvt Ltd."
}

enum NetworkError: String{
    
    case noInternet = "You are offline."
    case invalidUrl = "Seems your url is invlaid."
    case parsingError = "Json Decoder fail to decode."
    
}

enum AlertsMessage: String{
    case fieldRequired = "All fieds are required."
    case invalidCredentials = "Invalid credentials!"
}


enum ToolsEnum: String{
    case calculateSip = "Calculate SIP"
    case sipStepUp = "SIP Step Up Calculator"
    case calculateFutureValue = "Calculate Future Value"
    case costOfDelayInSip = "Cost of delay in SIP"
    case swpCalculator = "SWP Calculator"
    case lumpsumInvestment = "Lumpsum Investment"
    case sipTenure = "SIP Tenure"
    case emiCalculator = "EMI Calculator"
    case dreamHouse = "Dream House"
    case marriageCalculator = "Marriage Calculator"
    case educationCalculator = "Education Calculator"
    case retirementCalcuator = "Retirement Calculator"
    
    
    
}

public enum RequestType: String {
    case GET, POST
}


