//
//  RegisterInteractor.swift
//  Relitrade
//
//  Created by Deven on 12/25/18.
//  Copyright © 2018 investwell. All rights reserved.
//

import Foundation
import RxSwift

class RegisterInteractor: PresentorToInterectorProtocol, APIRequest{
    var method: RequestType
    
    var path: String
    

    var presenter: InterectorToPresenterProtocol?
    var isRegister: String?
    
    init() {
        method = RequestType.GET
        path = ""
    }
    
    func fetchData() {
        
    }
    
    func fetchData<T>(data: T) {
        
        if let registerUrl = data as? String{
            
            guard let url = URL(string: registerUrl) else {
                return
            }
            
            let observer: Observable<PortfolioResponseEntity> = Network.shared.get(baseUrl: url, apiRequest: self)
            
            observer.subscribe(onNext: { (value) in
                self.isRegister = value.flag
            }, onError: { (error) in
                self.isRegister = error.localizedDescription
            }, onCompleted: {
                if let canRegister = self.isRegister{
                    self.presenter?.dataFetched(news: canRegister)
                }else {
                    self.presenter?.dataFetched(news: "")
                }
                
            }) {
                
            }
            
        }
    }
    
}
