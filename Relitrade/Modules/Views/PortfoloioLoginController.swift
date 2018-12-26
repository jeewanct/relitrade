//
//  PortfoloioLoginController.swift
//  Relitrade
//
//  Created by Vaibhav Nath on 24/12/18.
//  Copyright © 2018 investwell. All rights reserved.
//

import UIKit


class PortfolioLoginController: UIViewController {
    
    @IBOutlet weak var userId: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var signIn: UIButton!
    
    var presenter: ViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func showPassword(_ sender: Any) {
        if let button = sender as? UIButton{
            if button.tag == 0{
                button.tag = 1
                password.isSecureTextEntry = false
            }else{
                button.tag = 0
                password.isSecureTextEntry = true
            }
        }
    }
    
    
    @IBAction func handleSignIn(_ sender: Any) {
        
        if userId.isEmpty || password.isEmpty{
            self.showAlert(title: AlertsMessage.fieldRequired.rawValue)
        }else{
            signIn.showIndicator()
            
            if let id = userId.text, let pass = password.text{
                presenter?.updateView()
                presenter?.updateView(data: "?bid=10512&user=\(id)&password=\(pass)")
            }
        }
        
    }
    
    @IBAction func handleSignUp(_ sender: Any) {
        
        let register = RegisterRoute.createModule()
        navigationController?.pushViewController(register, animated: true)
        
    }
    
    @IBAction func handleForgotPass(_ sender: Any) {
   
        let forgotPass = ForgotPassRoute.createModule()
        forgotPass.modalTransitionStyle = .coverVertical
        forgotPass.modalPresentationStyle = .overCurrentContext
        present(forgotPass, animated: true, completion: nil)
        //pushViewControlleforgotPassr(forgotPass, animated: true)
    
    }
    
    
    @IBAction func handleBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func gotToPin(){
        let pinController = HomeRoute.mainstoryboard.instantiateViewController(withIdentifier: "PinController") as! PinController
        self.present(pinController, animated: true, completion: nil)
    }
    
}

extension PortfolioLoginController: PresenterToViewProtocol {
  
    func showData<T>(data: T) {
        if let value = data as? Bool{
            if value{
                UserDefaults.standard.setValue(userId.text, forKey: "userName")
                UserDefaults.standard.setValue(password.text, forKey: "password")
                
                
            }else{
                self.showAlert(title: AlertsMessage.invalidCredentials.rawValue)
            }
        }
    }
    
    
    
    func showError() {
        
    }
    
    
}
