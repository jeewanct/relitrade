//
//  RegisterPresenter.swift
//  Relitrade
//
//  Created by Deven on 12/25/18.
//  Copyright © 2018 investwell. All rights reserved.
//

import Foundation

class RegisterPresenter: ViewToPresenterProtocol {

    var view: PresenterToViewProtocol?
    var interector: PresentorToInterectorProtocol?
    var router: PresenterToRouterProtocol?
    
    func updateView() {
        
    }
    var responseMessage = ""
    
    func updateView<T>(data: T) {
        interector?.fetchData(data: data)
    }
}

extension RegisterPresenter: InterectorToPresenterProtocol {
    func dataFetched<T>(news: T) {
        
        view?.showData(data: news)
    }
    
    func dataFetchedFailed() {
        
    }
    
    
    
}
