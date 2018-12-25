//
//  Networking.swift
//  AccountingApp
//
//  Created by JEEVAN TIWARI on 20/12/18.
//  Copyright © 2018 AccountingApp. All rights reserved.
//

import Foundation
import RxSwift

open class Network: NSObject{
    
    public static let shared = Network()
    
    //MARK: RxSwift
    func get<T: Codable>(baseUrl: URL, apiRequest: APIRequest) -> Observable<T>{
        let networkObservable = Observable<T>.create{
            observable in
            
            let request = apiRequest.request(with: baseUrl)
            
            let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                do{
                    let json = try JSONDecoder().decode(T.self, from: data ?? Data())
                    observable.onNext(json)
                }catch let jsonError{
                    observable.onError(jsonError)
                }
                observable.onCompleted()
            })
            
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
            
        }
        return networkObservable
    }
    
    func post<T: Decodable>(apiRequest: APIRequest) -> Observable<T>{
        let networkObservable = Observable<T>.create{
            observable in
            
            let request = apiRequest.request(with: Constants.BaseUrl.baseUrl)
            let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                do{
                    let json = try JSONDecoder().decode(T.self, from: data ?? Data())
                    observable.onNext(json)
                }catch let jsonError{
                    observable.onError(jsonError)
                }
                observable.onCompleted()
            })
            
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
            
        }
        return networkObservable
    }
   
}
