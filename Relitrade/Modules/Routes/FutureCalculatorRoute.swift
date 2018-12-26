//
//  FutureCalculatorRoute.swift
//  Relitrade
//
//  Created by Vaibhav Nath on 26/12/18.
//  Copyright © 2018 investwell. All rights reserved.
//

import UIKit

class FutureCalculatorRoute: PresenterToRouterProtocol{
    
    class func createModule() ->UIViewController{
        let view = mainstoryboard.instantiateViewController(withIdentifier: "FutureValueCalculatorController") as? FutureValueCalculatorController
        //if let view = navController.childViewControllers.first as? LiveNewsViewController {
        let presenter: ViewToPresenterProtocol & InterectorToPresenterProtocol = FutureCalculatorPresenter()
        let interactor: PresentorToInterectorProtocol = FutureCalculatorInteractor()
        let router: PresenterToRouterProtocol = FutureCalculatorRoute()
        
        view?.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interector = interactor
        interactor.presenter = presenter
        
        return view!
        
        //}
        
        //return UIViewController()
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
}



