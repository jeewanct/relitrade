//
//  LocateUsInteractor.swift
//  Relitrade
//
//  Created by Vaibhav Nath on 24/12/18.
//  Copyright © 2018 investwell. All rights reserved.
//

import Foundation
import CoreLocation
class LocateUsInteractor: PresentorToInterectorProtocol{
    
    var presenter: InterectorToPresenterProtocol?
    
    func fetchData() {
        
        let locateData = LocateUsEntity()
        
        let locateDetails = [
            HomeDetailsEntity(image: #imageLiteral(resourceName: "homeImage"), text: LocateUsEnum.address.rawValue, type: HomeOptionsEnum.about),
            HomeDetailsEntity(image: #imageLiteral(resourceName: "homeImage"), text: LocateUsEnum.phoneNumber.rawValue, type: HomeOptionsEnum.about),
            HomeDetailsEntity(image: #imageLiteral(resourceName: "homeImage"), text: LocateUsEnum.email.rawValue, type: HomeOptionsEnum.about),
            HomeDetailsEntity(image: #imageLiteral(resourceName: "homeImage"), text: LocateUsEnum.wesite.rawValue, type: HomeOptionsEnum.about)
        ]
        
        locateData.companyDetails = locateDetails
        locateData.companyName = LocateUsEnum.companyName.rawValue
        locateData.coordinate = CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275)
        presenter?.dataFetched(news: locateData)
    }
    
    func fetchData<T>(data: T) {
        
    }
    
}
