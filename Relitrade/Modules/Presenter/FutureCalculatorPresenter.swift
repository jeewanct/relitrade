//
//  FutureCalculatorPresenter.swift
//  Relitrade
//
//  Created by Vaibhav Nath on 26/12/18.
//  Copyright © 2018 investwell. All rights reserved.
//

import Foundation

class FutureCalculatorPresenter: ViewToPresenterProtocol {
    
    var view: PresenterToViewProtocol?
    var interector: PresentorToInterectorProtocol?
    var router: PresenterToRouterProtocol?
    
    func updateView() {
        
    }
    
    func updateView<T>(data: T) {
        interector?.fetchData(data: data)
    }
}

extension FutureCalculatorPresenter: InterectorToPresenterProtocol {
    func dataFetched<T>(news: T) {
        view?.showData(data: news)
    }
    
    func dataFetchedFailed() {
        
    }
    
    
    
}
