//
//  ForgotPassInteractor.swift
//  Relitrade
//
//  Created by Vaibhav Nath on 25/12/18.
//  Copyright © 2018 investwell. All rights reserved.
//

import Foundation
import RxSwift


class ForgotPassInteractor: PresentorToInterectorProtocol, APIRequest{
    var method: RequestType
    var path: String = ""
    var presenter: InterectorToPresenterProtocol?
    var message = ""
    
    init() {
        self.method = RequestType.GET
    }
    func fetchData() {
        
    }
    
    func fetchData<T>(data: T) {
        
        if let urlPath = data as? String{
            
            //path = urlPath
            
            let loginUrl = Constants.LoginUrl.forgetPass + "\(urlPath)/10512"
            guard let url = URL(string: loginUrl) else {
                return
            }
            
            let observer: Observable<ForgotPassEntity> =  Network.shared.get(baseUrl: url,apiRequest: self)
            
            observer.subscribe(onNext:  {(response) in
                
                if let responseMessage = response.getPasswordResult{
                    self.message = responseMessage
                }
                
            }, onError: { (error) in
                self.fetchData(data: error.localizedDescription)
                
            }, onCompleted: {
               self.presenter?.dataFetched(news: self.message)
            }) {
                
            }
            
            
        }
        
        
    }
    
}
