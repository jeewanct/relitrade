//
//  ForgotPassRoutes.swift
//  Relitrade
//
//  Created by Vaibhav Nath on 25/12/18.
//  Copyright © 2018 investwell. All rights reserved.
//

import UIKit

class ForgotPassRoute: PresenterToRouterProtocol{
    
    class func createModule() ->UIViewController{
        let view = mainstoryboard.instantiateViewController(withIdentifier: "ForgotPassController") as? ForgotPassController
        //if let view = navController.childViewControllers.first as? LiveNewsViewController {
        let presenter: ViewToPresenterProtocol & InterectorToPresenterProtocol = ForgotPassPresenter()
        let interactor: PresentorToInterectorProtocol = ForgotPassInteractor()
        let router: PresenterToRouterProtocol = ForgotPassRoute()
        
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


