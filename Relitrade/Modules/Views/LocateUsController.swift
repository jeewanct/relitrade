//
//  LocateUsController.swift
//  Relitrade
//
//  Created by Vaibhav Nath on 24/12/18.
//  Copyright © 2018 investwell. All rights reserved.
//

import UIKit
import MapKit

class LocateUsController: UIViewController {
    
    var presenter: ViewToPresenterProtocol?

    @IBOutlet weak var locationMap: MKMapView!
    @IBOutlet weak var companyName: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    var locateUsDetails: LocateUsEntity?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.updateView()
      
    }
    
    @IBAction func handleBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension LocateUsController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locateUsDetails?.companyDetails?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocateUsCell", for: indexPath) as! LocateUsCell
        cell.details = locateUsDetails?.companyDetails?[indexPath.item]
        return cell
    }
}


extension LocateUsController: PresenterToViewProtocol {
    
    func showData<T>(data: T) {
        
        if let locateData = data as? LocateUsEntity{
            locateUsDetails = locateData
            tableView.reloadData()
            
            
            
            if let coordinate = locateData.coordinate{
                let london = MKPointAnnotation()
                london.coordinate = coordinate
                locationMap.addAnnotation(london)
            }
            
        }
        
    }
    
    func showError() {
        
    }
    
    
}

