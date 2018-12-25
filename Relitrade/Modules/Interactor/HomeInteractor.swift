//
//  HomeInteractor.swift
//  Relitrade
//
//  Created by Vaibhav Nath on 24/12/18.
//  Copyright © 2018 investwell. All rights reserved.
//

import Foundation

class HomeInteractor: PresentorToInterectorProtocol{
    
    
    var presenter: InterectorToPresenterProtocol?
    
    func fetchData() {
        
        let homeData = HomeEntity()
        
        let homeOptions = [
            HomeDetailsEntity(image: #imageLiteral(resourceName: "call"), text: HomeOptionsEnum.portfolioLogin.rawValue),
            HomeDetailsEntity(image: #imageLiteral(resourceName: "call"), text: HomeOptionsEnum.topSchemes.rawValue),
            HomeDetailsEntity(image: #imageLiteral(resourceName: "call"), text: HomeOptionsEnum.fundPicks.rawValue),
            HomeDetailsEntity(image: #imageLiteral(resourceName: "call"), text: HomeOptionsEnum.tools.rawValue),
            HomeDetailsEntity(image: #imageLiteral(resourceName: "call"), text: HomeOptionsEnum.nfo.rawValue),
            HomeDetailsEntity(image: #imageLiteral(resourceName: "call"), text: HomeOptionsEnum.latestNav.rawValue),
            HomeDetailsEntity(image: #imageLiteral(resourceName: "call"), text: HomeOptionsEnum.knowledgeArea.rawValue),
            HomeDetailsEntity(image: #imageLiteral(resourceName: "call"), text: HomeOptionsEnum.about.rawValue),
            HomeDetailsEntity(image: #imageLiteral(resourceName: "call"), text: HomeOptionsEnum.locateUs.rawValue)
        ]
        
        let connectOptions = [
            HomeDetailsEntity(image: #imageLiteral(resourceName: "call"), text: SocialOptionEnum.callNow.rawValue),
            HomeDetailsEntity(image: #imageLiteral(resourceName: "message"), text: SocialOptionEnum.message.rawValue),
            HomeDetailsEntity(image: #imageLiteral(resourceName: "email"), text: SocialOptionEnum.email.rawValue),
            HomeDetailsEntity(image: #imageLiteral(resourceName: "whatsapp"), text: SocialOptionEnum.whatsapp.rawValue),
            HomeDetailsEntity(image: #imageLiteral(resourceName: "share"), text: SocialOptionEnum.share.rawValue)
        
        ]
        
        homeData.connectOptions = connectOptions
        homeData.homeOptions = homeOptions
        homeData.backgroundImage = #imageLiteral(resourceName: "homeBackground")
        homeData.connectBackground = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        presenter?.dataFetched(news: homeData)
        
    }

    func fetchData<T>(data: T) {
        
    }
    
}
