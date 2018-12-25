//
//  Constants.swift
//  Relitrade
//
//  Created by Vaibhav Nath on 25/12/18.
//  Copyright © 2018 investwell. All rights reserved.
//

import Foundation

struct Constants{
    
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
    }
    
    
    struct LoginUrl{
        static let signIn = "http://m.investwell.in/hc/logincheck.jsp"
        static let forgetPass =  "http://restws.my-portfolio.in/mobileWS.svc/getPassword/"
    }
}
