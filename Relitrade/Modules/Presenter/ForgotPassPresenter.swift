//
//  ForgotPassPresenter.swift
//  Relitrade
//
//  Created by Vaibhav Nath on 25/12/18.
//  Copyright © 2018 investwell. All rights reserved.
//

import Foundation

class ForgotPassPresenter: ViewToPresenterProtocol {
    
    var view: PresenterToViewProtocol?
    var interector: PresentorToInterectorProtocol?
    var router: PresenterToRouterProtocol?
    
    func updateView() {
        
    }
    func updateView<T>(data: T) {
        interector?.fetchData(data: data)
    }
}

extension ForgotPassPresenter: InterectorToPresenterProtocol {
    func dataFetched<T>(news: T) {
        view?.showData(data: news)
    }
    
    func dataFetchedFailed() {
        
    }
    
    
    
}
