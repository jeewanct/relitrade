//
//  FutureValueCalculatorController.swift
//  Relitrade
//
//  Created by Vaibhav Nath on 26/12/18.
//  Copyright © 2018 investwell. All rights reserved.
//

import UIKit

class FutureValueCalculatorController: UIViewController{
    
    @IBOutlet weak var amoutText: UITextField!
    @IBOutlet weak var investmentPeriod: UITextField!
    @IBOutlet weak var expectedReturn: UITextField!
    
    var presenter: ViewToPresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func handleReset(_ sender: Any) {
        amoutText.text = ""
        investmentPeriod.text = ""
        expectedReturn.text = ""
    }
    
    
    @IBAction func handleCalculate(_ sender: Any) {
    
        if amoutText.isEmpty || investmentPeriod.isEmpty || investmentPeriod.isEmpty{
            self.showAlert(title: AlertsMessage.fieldRequired.rawValue)
        }else{
            let information = FutureCalculatorEntity(amount: amoutText.text, years: investmentPeriod.text, expectedReturn: expectedReturn.text)
            presenter?.updateView(data: information)
        }
        
        
    }
    
    @IBAction func handleShare(_ sender: Any) {
        func share(){
            self.shareItems(items: ["This is sharing info"])
        }
    }
    
    @IBAction func handleBack(_ sender: Any) {
    
        navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func handleHome(_ sender: Any) {
    
        for controller in navigationController?.viewControllers ?? [UINavigationController()]{
            if controller is HomeController{
                self.navigationController?.popToViewController(controller, animated: true)
            }
        }
    
    }
    
}


extension FutureValueCalculatorController: PresenterToViewProtocol {
    
    func showData<T>(data: T) {
        if let message = data as? String{
           self.showAlert(title: message)
        }
    }
    
    func showError() {
        
    }
    
}
