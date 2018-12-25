//
//  RegisterRoute.swift
//  Relitrade
//
//  Created by Deven on 12/25/18.
//  Copyright © 2018 investwell. All rights reserved.
//

import UIKit

class RegisterRoute: PresenterToRouterProtocol{
    
    class func createModule() ->UIViewController{
        let view = mainstoryboard.instantiateViewController(withIdentifier: "RegisterController") as? RegisterController
        //if let view = navController.childViewControllers.first as? LiveNewsViewController {
        let presenter: ViewToPresenterProtocol & InterectorToPresenterProtocol = RegisterPresenter()
        let interactor: PresentorToInterectorProtocol = RegisterInteractor()
        let router: PresenterToRouterProtocol = RegisterRoute()
        
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




