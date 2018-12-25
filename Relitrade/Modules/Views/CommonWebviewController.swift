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
}

extension CommonWebviewController{
    
    func getAppropiateWebPage(){
        
        backButton.setTitle(backTitle, for: .normal)
        
        
        guard let webPage = webType else{
            return
        }
        
        var url = ""
        switch webPage {
        case .topSchemes:
            url = Constants.HomeUrl.topSchemes +  "bid=30459&user=demo1234&password=123456&phone=ios"
        case .fundPicks:
            url = Constants.HomeUrl.fundPicks + "bid=30459"
        case .nfo:
            url = Constants.HomeUrl.nfo + ""
        case .latestNav:
            url = Constants.HomeUrl.latesNav + ""
        case .knowledgeArea:
            url = Constants.HomeUrl.knowledgeArea
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
