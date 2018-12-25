//
//  RegisterController.swift
//  Relitrade
//
//  Created by Deven on 12/25/18.
//  Copyright © 2018 investwell. All rights reserved.
//

import UIKit

class RegisterController: UIViewController{

    var presenter: ViewToPresenterProtocol?

    @IBOutlet weak var userNameText: UITextField!
    
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var phoneText: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func handleReset(_ sender: Any) {
        userNameText.text = ""
        emailText.text = ""
        phoneText.text = ""
    }
    
    @IBAction func handleRegister(_ sender: Any) {
        
    }
    
    
    @IBAction func handleBack(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func handleHome(_ sender: Any) {
        for viewController in navigationController?.viewControllers ?? [UINavigationController()]{
            if viewController is HomeController{
                self.navigationController?.popToViewController(viewController, animated: true)
            }
        }
    }
    
    
}


extension RegisterController: PresenterToViewProtocol {
    
    func showData<T>(data: T) {
        if let message = data as? String{
            DispatchQueue.main.async {
                self.showAlert(title: message)
            }
            
            
        }
    }
    
    func showError() {
    }
    
}
