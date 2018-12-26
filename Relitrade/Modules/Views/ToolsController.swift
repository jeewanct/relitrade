//
//  ToolsController.swift
//  Relitrade
//
//  Created by Vaibhav Nath on 24/12/18.
//  Copyright © 2018 investwell. All rights reserved.
//

import UIKit


class ToolsController: UICollectionViewController {
    
    var presenter: ViewToPresenterProtocol?
    var toolsItems: [HomeDetailsEntity]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter?.updateView()
    }
    
    @IBAction func handlBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}

extension ToolsController{
    func setup(){
        
        collectionView.register(UINib(nibName: "HomeCell", bundle: nil), forCellWithReuseIdentifier: "HomeCell")
    }
    
}

extension ToolsController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 64, height: UIScreen.main.bounds.height * 0.07 + 16) 
        
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return toolsItems?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath)  as! HomeCell
        cell.details = toolsItems?[indexPath.item]
        return cell
    }
}

extension ToolsController{
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.item {
        case 2:
            let calculateFuture = FutureCalculatorRoute.createModule()
            navigationController?.pushViewController(calculateFuture, animated: true)
        default:
            let webview = CommonWebRoute.createModule() as? CommonWebviewController
            webview?.backTitle = toolsItems?[indexPath.item].optionLabel
            webview?.webType = toolsItems?[indexPath.item].type
            navigationController?.pushViewController(webview ?? UIViewController(), animated: true)
            
        }
    }
}

extension ToolsController: PresenterToViewProtocol {
    
    func showData<T>(data: T) {
        if let unwrappedData = data as? [HomeDetailsEntity]{
            self.toolsItems = unwrappedData
            collectionView.reloadData()
        }
    }
    
    func showError() {
        
    }
    
    
}



