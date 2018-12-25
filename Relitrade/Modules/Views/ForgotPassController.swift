//
//  ForgotPassController.swift
//  Relitrade
//
//  Created by Vaibhav Nath on 25/12/18.
//  Copyright © 2018 investwell. All rights reserved.
//

import UIKit

class ForgotPassController: UIViewController{
    
    var presenter: ViewToPresenterProtocol?
    
    @IBOutlet weak var userEmailText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func handleSubmit(_ sender: Any) {
        if userEmailText.isEmpty{
            self.showAlert(title: AlertsMessage.fieldRequired.rawValue)
        }else{
            if let email = userEmailText.text{
                presenter?.updateView(data: "\(email)")
            }
            
        }
    }
    
    @IBAction func handleCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension ForgotPassController: PresenterToViewProtocol {

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
