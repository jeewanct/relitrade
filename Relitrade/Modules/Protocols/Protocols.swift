//
//  Protocols.swift
//  Relitrade
//
//  Created by Vaibhav Nath on 24/12/18.
//  Copyright © 2018 investwell. All rights reserved.
//

import Foundation
import UIKit

protocol PresenterToViewProtocol: class {
    func showData<T>(data: T)
    func showError()
}

protocol InterectorToPresenterProtocol: class {
    func dataFetched<T>(news: T)
    func dataFetchedFailed()
}

protocol PresentorToInterectorProtocol: class {
    var presenter: InterectorToPresenterProtocol? {get set}
    func fetchData()
    func fetchData<T>(data: T)
    
}

protocol ViewToPresenterProtocol: class {
    var view: PresenterToViewProtocol? {get set};
    var interector: PresentorToInterectorProtocol? {get set};
    var router: PresenterToRouterProtocol? {get set}
    func updateView()
    func updateView<T>(data: T)
    
}

protocol PresenterToRouterProtocol: class {
    static func createModule() -> UIViewController
}


extension PresentorToInterectorProtocol{
    
}


extension ViewToPresenterProtocol{
    
}

protocol APIRequest {
    var method: RequestType { get }
    var path: String { get }
    //var parameters: [String : String] { get }
}
