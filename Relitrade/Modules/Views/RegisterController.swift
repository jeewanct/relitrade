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
    
    @IBOutlet weak var registerButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func handleReset(_ sender: Any) {
        userNameText.text = ""
        emailText.text = ""
        phoneText.text = ""
    }
    
    @IBAction func handleRegister(_ sender: Any) {
        
        
        if userNameText.isEmpty{
            self.showAlert(title: "User Name" + AlertsMessage.fieldRequireds.rawValue)
        }else if !emailText.isEmail{
            self.showAlert(title: AlertsMessage.emailInvalid.rawValue)
        }else if !phoneText.isNumber{
            self.showAlert(title: AlertsMessage.phoneInvalid.rawValue)
        }else{
            if let userName = userNameText.text, let email = emailText.text, let phone = phoneText.text{
                registerButton.showIndicator()
                let register = Constants.LoginUrl.registerUser + "\(Constants.bid)&name=\(userName)&mobile=\(phone)&email=\(email)"
                presenter?.updateView(data: register)
            }
            
        }
        
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
                self.registerButton.hideIndicator(title: "Register")
                if message == "Y"{
                    self.showAlert(title: AlertsMessage.registered.rawValue)
                    self.handleReset("")
                }else{
                    self.showAlert(title: NetworkError.unkown.rawValue)
                }
            }

        }
    }
    
    func showError() {
    }
    
}
