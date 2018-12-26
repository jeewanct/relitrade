//
//  HomeController.swift
//  Relitrade
//
//  Created by Vaibhav Nath on 24/12/18.
//  Copyright © 2018 investwell. All rights reserved.
//

import UIKit
import MessageUI


class HomeController: UIViewController {
    
    @IBOutlet weak var homeCollectionView: UICollectionView!
    @IBOutlet weak var connectCollectionView: UICollectionView!
    
    var presenter: ViewToPresenterProtocol?
    var homeDetails: HomeEntity?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter?.updateView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.whiteBackground()
       
        let myCustomView = UIView.fromNib()
        navigationItem.titleView = myCustomView
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.blueBackground()
    }
    
}


//MARK: View controller setup

extension HomeController{
    
    func setup(){
        navigationController?.hideTransluceny()
        
        homeCollectionView.register(UINib(nibName: "HomeHeader", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HomeHeader")
        homeCollectionView.register(UINib(nibName: "HomeCell", bundle: nil), forCellWithReuseIdentifier: "HomeCell")
        connectCollectionView.register(UINib(nibName: "ConnectUsCell", bundle: nil), forCellWithReuseIdentifier: "ConnectUsCell")
    }
}

//MARK: Collection view delegate and dataSource here

extension HomeController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if collectionView == connectCollectionView{
           return UICollectionReusableView()
        }
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HomeHeader", for: indexPath) as! HomeHeader
        view.stockValue = homeDetails?.stockValue
        return view
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if collectionView == connectCollectionView{
            return CGSize(width: 0, height: 0)
        }
        return CGSize(width: view.frame.width, height: 100 )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == homeCollectionView{
            return CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.07 + 16)
        }
        
        return CGSize(width: connectCollectionView.frame.width / 5 , height: connectCollectionView.frame.height)
        
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == homeCollectionView{
            return homeDetails?.homeOptions?.count ?? 0
        }
        
        return homeDetails?.connectOptions?.count ?? 0 
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == homeCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCell
            cell.details = homeDetails?.homeOptions?[indexPath.item]
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ConnectUsCell", for: indexPath) as! ConnectUsCell
        cell.details = homeDetails?.connectOptions?[indexPath.item]
        return cell
        
    }
    
}

//MARK: Handle Tap Actions

extension HomeController: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == homeCollectionView{
            
            switch indexPath.item{
            case 0:
                let portfolioLogin = PortfolioRoute.createModule()
                navigationController?.pushViewController(portfolioLogin, animated: true)
            case 1,2,4,5,6,7:
                let webView = CommonWebRoute.createModule() as? CommonWebviewController
                switch indexPath.item{
                case 1: webView?.webType = HomeOptionsEnum.topSchemes
                        webView?.backTitle = HomeOptionsEnum.topSchemes.rawValue
                case 2: webView?.webType = HomeOptionsEnum.fundPicks
                        webView?.backTitle = HomeOptionsEnum.fundPicks.rawValue
                case 4: webView?.webType = HomeOptionsEnum.nfo
                        webView?.backTitle = HomeOptionsEnum.nfo.rawValue
                case 5: webView?.webType = HomeOptionsEnum.latestNav
                        webView?.backTitle = HomeOptionsEnum.latestNav.rawValue
                case 6: webView?.webType = HomeOptionsEnum.knowledgeArea
                        webView?.backTitle = HomeOptionsEnum.knowledgeArea.rawValue
                default: webView?.webType = HomeOptionsEnum.about
                        webView?.backTitle = HomeOptionsEnum.about.rawValue
                }
                navigationController?.pushViewController(webView ?? UIViewController(), animated: true)
            case 3:
                let tools = ToolsRoute.createModule()
                navigationController?.pushViewController(tools, animated: true)
            default: print("")
                let locateUs = LocateUsRoute.createModule()
                navigationController?.pushViewController(locateUs, animated: true)
            }
        }else{
            
            switch indexPath.item{
            case 0:
                if let url = URL(string: "tel://\(9045152406)"), UIApplication.shared.canOpenURL(url) {
                    if #available(iOS 10, *) {
                        UIApplication.shared.open(url)
                    } else {
                        UIApplication.shared.openURL(url)
                    }
                }
            case 1: sendMessage(number: "")
            case 2: sendEmail()
            case 3: print("")
            default: share()
            }
            
        }
    }
}


extension HomeController: MFMessageComposeViewControllerDelegate, MFMailComposeViewControllerDelegate{
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func sendMessage(number: String){
        if MFMessageComposeViewController.canSendText(){
        let controller = MFMessageComposeViewController()
        controller.body = "Message Body"
        controller.recipients = ["9045152406"]
        controller.messageComposeDelegate = self
        self.present(controller, animated: true, completion: nil)
        }
    }
    
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["you@yoursite.com"])
            mail.setMessageBody("<p>You're so awesome!</p>", isHTML: true)
            
            present(mail, animated: true)
        } else {
            // show failure alert
        }
    }
    
    func share(){
        self.shareItems(items: ["This is sharing info"])
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
}

extension HomeController: PresenterToViewProtocol {
    func showData<T>(data: T) {
        
        
            if let homeData = data as? HomeEntity{
                
                homeDetails = homeData
                DispatchQueue.main.async {
                self.homeCollectionView.reloadData()
                self.connectCollectionView.reloadData()
                self.connectCollectionView.backgroundColor = homeData.connectBackground
                
                }
            }
        
    }
    
    func showError() {
        
    }
    
}

