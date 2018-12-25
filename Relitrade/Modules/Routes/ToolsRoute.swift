//
//  ToolsRoute.swift
//  Relitrade
//
//  Created by Vaibhav Nath on 24/12/18.
//  Copyright © 2018 investwell. All rights reserved.
//

import UIKit

class ToolsRoute: PresenterToRouterProtocol{
    
    class func createModule() ->UIViewController{
        let view = mainstoryboard.instantiateViewController(withIdentifier: "ToolsController") as? ToolsController
        //if let view = navController.childViewControllers.first as? LiveNewsViewController {
        let presenter: ViewToPresenterProtocol & InterectorToPresenterProtocol = ToolPresenter()
        let interactor: PresentorToInterectorProtocol = ToolsInteractor()
        let router: PresenterToRouterProtocol = ToolsRoute()
        
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
