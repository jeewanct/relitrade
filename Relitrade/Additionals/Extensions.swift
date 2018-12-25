//
//  Extensions.swift
//  Relitrade
//
//  Created by Vaibhav Nath on 24/12/18.
//  Copyright © 2018 investwell. All rights reserved.
//

import UIKit
import WebKit

extension UINavigationController{
    
    func whiteBackground(){
        self.navigationBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    func blueBackground(){
        self.navigationBar.barTintColor = #colorLiteral(red: 0.1411764706, green: 0.3137254902, blue: 0.6235294118, alpha: 1)
    }
    
    
    func hideTransluceny(){
        self.navigationBar.isTranslucent = false
        self.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationBar.shadowImage = UIImage()
        
    }
}


extension WKWebView {
    func load(_ urlString: String) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            load(request)
        }
    }
}

extension APIRequest {
    func request(with baseURL: URL) -> URLRequest {
//        guard var components = URLComponents(url: baseURL.appendingPathComponent(path), resolvingAgainstBaseURL: false) else {
//            fatalError("Unable to create URL components")
//        }
        
//        components.queryItems = parameters.map {
//            URLQueryItem(name: String($0), value: String($1))
//        }
        
//        guard let url = components.url else {
//            fatalError("Could not get url")
//        }
        
        var request = URLRequest(url: baseURL)
        request.httpMethod = method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }
}

extension UIButton{
    
    func showIndicator(){
        let activityIndicator = UIActivityIndicatorView(style: .white)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        
        self.addSubview(activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        
        activityIndicator.startAnimating()
        self.isUserInteractionEnabled = false
        self.setTitle("", for: .normal)
    }
    
    func hideIndicator(title: String){
        
        for view in self.subviews{
            
            if view is UIActivityIndicatorView{
                view.removeFromSuperview()
            }
        }
        
        self.isUserInteractionEnabled = true
        self.setTitle(title, for: .normal)
    }
    
}


extension UITextField{
    
    var isEmpty: Bool{
        if self.text == ""{
            return true
        }
        
        return false
    }
    
}


extension UIViewController{
    
    func showAlert(title: String){
        
        let alertController = UIAlertController(title: "", message: title, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
}


extension UIView {
    class func fromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: "NavigationBarImage"), owner: nil, options: nil)![0] as! T
    }
}
