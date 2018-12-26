//
//  Constants.swift
//  Relitrade
//
//  Created by Vaibhav Nath on 25/12/18.
//  Copyright © 2018 investwell. All rights reserved.
//

import Foundation

struct Constants{
    
    static let bid = "10512"
    
    struct BaseUrl{
        static let baseUrl = URL(string: "")!
        static let stringBaseUrl = "http://m.investwell.in/hc/newtpsch.jsp?"
    }
    
    struct HomeUrl{
        static var topSchemes = "http://m.investwell.in/hc/newtpsch.jsp?"
        static let fundPicks = "https://my-portfolio.in/MobileSchemeRecommendation.aspx?"
        static let nfo = ""
        static let latesNav = ""
        static let knowledgeArea = "https://www.investwellonline.com/knowledgeBase/kbtab.html"
        static let about = "http://my-portfolio.in/SubDomainLogos/Template/AboutUs30459.html"
        static let stockValue = "http://ws.my-portfolio.in/IWService.asmx"
        static let stockXmlBody = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap12:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap12=\"http://www.w3.org/2003/05/soap-envelope\"><soap12:Body><GetIndex xmlns=\"http://tempuri.org/\" /></soap12:Body></soap12:Envelope>"
    }
    
    
    struct LoginUrl{
        static let signIn = "http://m.investwell.in/hc/logincheck.jsp"
        static let forgetPass =  "http://restws.my-portfolio.in/mobileWS.svc/getPassword/"
        static let registerUser = "http://m.investwell.in/hc/setuser.jsp?bid="
    }
    
    struct ToolsUrl{
        static let educationCalculator = "http://m.investwell.in/parameter/calculator/par_education_plannerM.jsp?bid=\(Constants.bid)"
        static let retirementCalculator = "http://m.investwell.in/parameter/calculator/par_retirement_calculatorM.jsp?bid=\(Constants.bid)"
        static let marriageCalculatr = "http://m.investwell.in/parameter/calculator/par_marriage_plannerM.jsp?bid=\(Constants.bid)"
        static let emiCalculator = "http://m.investwell.in/parameter/calculator/par_emi_calculatorM.jsp?bid=\(Constants.bid)"
        static let sipStepUpCalculator = "http://www.investwell.in/updation/parameter/Calculator/par_sip_stepup_calculatorN.jsp"
        static let sipTenure = "http://m.investwell.in/parameter/calculator/par_siptenure_calculatorM.jsp?bid=\(Constants.bid)"
        static let lupsum = "http://m.investwell.in/parameter/calculator/par_return_calculatorM.jsp?bid=\(Constants.bid)"
        static let costofDelayinSip = "http://m.investwell.in/parameter/calculator/par_sipdelay_calculatorM.jsp?bid=\(Constants.bid)"
        static let sipCalculator = "http://m.investwell.in/parameter/calculator/par_sip_calculatorM.jsp?bid=\(Constants.bid)"
    }
}
