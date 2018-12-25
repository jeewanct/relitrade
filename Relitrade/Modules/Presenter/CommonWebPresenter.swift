//
//  CommonWebPresenter.swift
//  Relitrade
//
//  Created by Vaibhav Nath on 24/12/18.
//  Copyright © 2018 investwell. All rights reserved.
//

import Foundation

class CommonWebPresenter: ViewToPresenterProtocol {
    
    
    
    var view: PresenterToViewProtocol?
    var interector: PresentorToInterectorProtocol?
    var router: PresenterToRouterProtocol?
    
    func updateView() {
        
    }
    func updateView<T>(data: T) {
        
    }
}

extension CommonWebPresenter: InterectorToPresenterProtocol {
    func dataFetched<T>(news: T) {
        
    }
    
    func dataFetchedFailed() {
        
    }
    
    
    
}
