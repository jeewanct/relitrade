//
//  LocateUsPresenter.swift
//  Relitrade
//
//  Created by Vaibhav Nath on 24/12/18.
//  Copyright © 2018 investwell. All rights reserved.
//

import Foundation

class LocateUsPresenter: ViewToPresenterProtocol {
    
    var view: PresenterToViewProtocol?
    var interector: PresentorToInterectorProtocol?
    var router: PresenterToRouterProtocol?
    
    func updateView() {
        interector?.fetchData()
    }
    func updateView<T>(data: T) {
        
    }
}

extension LocateUsPresenter: InterectorToPresenterProtocol {
    func dataFetched<T>(news: T) {
        view?.showData(data: news)
    }
    
    func dataFetchedFailed() {
        
    }
    
    
    
}
