//
//  PortfolioInteractor.swift
//  Relitrade
//
//  Created by Vaibhav Nath on 24/12/18.
//  Copyright © 2018 investwell. All rights reserved.
//

import Foundation
import RxSwift

class PortfolioInteractor: PresentorToInterectorProtocol, APIRequest{
    
    var method: RequestType
    var path: String = ""
    var presenter: InterectorToPresenterProtocol?
    var canLogin: Bool?
    
    init() {
        method = RequestType.GET
    }

    func fetchData() {
        
    }
    
    func fetchData<T>(data: T) {
        
        if let urlPath = data as? String{
            
            //path = urlPath
            
            let loginUrl = Constants.LoginUrl.signIn + urlPath
            guard let url = URL(string: loginUrl) else {
                return
            }
            
            
            
            let observer: Observable<PortfolioResponseEntity> =  Network.shared.get(baseUrl: url,apiRequest: self)
            
            observer.subscribe(onNext:  {(response) in
                if let login = response.flag{
                    if login == "Y"{
                        self.canLogin = true
                    }else{
                        self.canLogin = false
                    }
                }
            }, onError: { (error) in
                self.canLogin = false
            }, onCompleted: {
                if let login = self.canLogin {
                    self.presenter?.dataFetched(news: login)
                }
                
            }) {
                
            }
            
        }
    }
    
    
}
