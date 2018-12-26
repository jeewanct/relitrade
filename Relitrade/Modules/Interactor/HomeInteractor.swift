//
//  HomeInteractor.swift
//  Relitrade
//
//  Created by Vaibhav Nath on 24/12/18.
//  Copyright © 2018 investwell. All rights reserved.
//

import Foundation
import RxSwift

class HomeInteractor: PresentorToInterectorProtocol, APIRequest{
  
    var method: RequestType
    var path: String
    
    var presenter: InterectorToPresenterProtocol?
    var homeData = HomeEntity()
    
    init() {
        method = RequestType.POST
        path = ""
    }
    
    
    func fetchData() {
        
        
        
        let homeOptions = [
            HomeDetailsEntity(image: #imageLiteral(resourceName: "call"), text: HomeOptionsEnum.portfolioLogin.rawValue, type: HomeOptionsEnum.portfolioLogin),
            HomeDetailsEntity(image: #imageLiteral(resourceName: "call"), text: HomeOptionsEnum.topSchemes.rawValue, type: HomeOptionsEnum.topSchemes),
            HomeDetailsEntity(image: #imageLiteral(resourceName: "call"), text: HomeOptionsEnum.fundPicks.rawValue, type: HomeOptionsEnum.fundPicks),
            HomeDetailsEntity(image: #imageLiteral(resourceName: "call"), text: HomeOptionsEnum.tools.rawValue, type: HomeOptionsEnum.tools),
            HomeDetailsEntity(image: #imageLiteral(resourceName: "call"), text: HomeOptionsEnum.nfo.rawValue, type: HomeOptionsEnum.nfo),
            HomeDetailsEntity(image: #imageLiteral(resourceName: "call"), text: HomeOptionsEnum.latestNav.rawValue, type: HomeOptionsEnum.latestNav),
            HomeDetailsEntity(image: #imageLiteral(resourceName: "call"), text: HomeOptionsEnum.knowledgeArea.rawValue, type: HomeOptionsEnum.knowledgeArea),
            HomeDetailsEntity(image: #imageLiteral(resourceName: "call"), text: HomeOptionsEnum.about.rawValue, type: HomeOptionsEnum.about),
            HomeDetailsEntity(image: #imageLiteral(resourceName: "call"), text: HomeOptionsEnum.locateUs.rawValue, type: HomeOptionsEnum.locateUs)
        ]
        
        let connectOptions = [
            HomeDetailsEntity(image: #imageLiteral(resourceName: "call"), text: SocialOptionEnum.callNow.rawValue, type: HomeOptionsEnum.portfolioLogin),
            HomeDetailsEntity(image: #imageLiteral(resourceName: "message"), text: SocialOptionEnum.message.rawValue, type: HomeOptionsEnum.portfolioLogin),
            HomeDetailsEntity(image: #imageLiteral(resourceName: "email"), text: SocialOptionEnum.email.rawValue, type: HomeOptionsEnum.portfolioLogin),
            HomeDetailsEntity(image: #imageLiteral(resourceName: "whatsapp"), text: SocialOptionEnum.whatsapp.rawValue, type: HomeOptionsEnum.portfolioLogin),
            HomeDetailsEntity(image: #imageLiteral(resourceName: "share"), text: SocialOptionEnum.share.rawValue, type: HomeOptionsEnum.portfolioLogin)
        
        ]
        
        homeData.connectOptions = connectOptions
        homeData.homeOptions = homeOptions
        homeData.backgroundImage = #imageLiteral(resourceName: "homeBackground")
        homeData.connectBackground = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        presenter?.dataFetched(news: homeData)
        
        fetchData(data: "")
        
    }

    func fetchData<T>(data: T) {
        
        guard let url =  URL(string: Constants.HomeUrl.stockValue) else {
            return
        }
        
        let observer: Observable<[HomeShareEntity]> =  Network.shared.postXml(baseUrl: url, apiRequest: self)
        
        observer.subscribe(onNext: { (value) in
            
            self.homeData.stockValue = value
            
        }, onError: { (error) in
            
            
        }, onCompleted: {
            self.presenter?.dataFetched(news: self.homeData)
            
        }) {
            
            
        }
        
        
        
        
    }
    
}
