//
//  CommonWebviewController.swift
//  Relitrade
//
//  Created by Vaibhav Nath on 24/12/18.
//  Copyright © 2018 investwell. All rights reserved.
//

import UIKit
import WebKit

class CommonWebviewController: UIViewController {
    
    var presenter: ViewToPresenterProtocol?
    var webType: HomeOptionsEnum?
    var backTitle: String?
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var contentWeb: WKWebView!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAppropiateWebPage()
       
    }
    
    @IBAction func handleBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func handleHome(_ sender: Any) {
        
        for controller in navigationController?.viewControllers ?? [UINavigationController()] {
            if controller is HomeController{
                self.navigationController?.popToViewController(controller, animated: true)
            }
        }
    }
}

extension CommonWebviewController{
    
    func getAppropiateWebPage(){
        
        backButton.setTitle(backTitle, for: .normal)
        
        
        guard let webPage = webType else{
            return
        }
        
        var url = ""
        switch webPage {
        case .topSchemes: url = Constants.HomeUrl.topSchemes +  "bid=\(Constants.bid)&user=demo1234&password=123456&phone=ios"
        case .fundPicks: url = Constants.HomeUrl.fundPicks + "bid=30459"
        case .nfo: url = Constants.HomeUrl.nfo + ""
        case .latestNav: url = Constants.HomeUrl.latesNav + ""
        case .knowledgeArea: url = Constants.HomeUrl.knowledgeArea
        case .calculateSip: url = Constants.ToolsUrl.sipCalculator
        case .sipStepUp: url = Constants.ToolsUrl.sipStepUpCalculator
        case .costOfDelayInSip: url = Constants.ToolsUrl.costofDelayinSip
        case .swpCalculator: print("")
        case .lumpsumInvestment: url = Constants.ToolsUrl.lupsum
        case .sipTenure: url = Constants.ToolsUrl.sipTenure
        case .emiCalculator: url = Constants.ToolsUrl.emiCalculator
        case .dreamHouse: url = ""
        case.marriageCalculator: url = Constants.ToolsUrl.marriageCalculatr
        case .educationCalculator: url = Constants.ToolsUrl.educationCalculator
        case .retirementCalcuator: url = Constants.ToolsUrl.retirementCalculator
        default:
            url = Constants.HomeUrl.about
        }
        
        
        contentWeb.load(url)
        contentWeb.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
        
    }
    
}

extension CommonWebviewController{
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            print(Float(contentWeb.estimatedProgress))
            progressView.progress = Float(contentWeb.estimatedProgress)
            
            if progressView.progress == Float(1){
                progressView.isHidden = true
            }
            
        }
    }
}


extension CommonWebviewController: PresenterToViewProtocol {
    func showData<T>(data: T) {
        
    }
    
    func showError() {
        
    }
    
    
}
