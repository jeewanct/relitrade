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
    
    
    func postXml<T: Codable>(baseUrl: URL, apiRequest: APIRequest) -> Observable<T>{
        let networkObservable = Observable<T>.create{
            observable in
            
            let request = apiRequest.requestWithXml(with: baseUrl)
            
            let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                do{
                    let convertedData = Helper.shared.convertToJsonData(data: data)
                    let json = try JSONDecoder().decode(T.self, from: convertedData)
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
    
    
    // Xml
    
    func tryXml(){
        var xmlStr: String = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap12:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap12=\"http://www.w3.org/2003/05/soap-envelope\"><soap12:Body><GetIndex xmlns=\"http://tempuri.org/\" /></soap12:Body></soap12:Envelope>"
        
        //  If the service endpoint is  "http://www.chilkatsoft.com/xmlEcho.asp",
        //  then we have the following arguments to be passed to
        //  SynchronousRequest:
        
        
        //  Prepare the HTTP request object:
        var request = URLRequest(url: URL(string: "http://ws.my-portfolio.in/IWService.asmx")!)
        
        
        //  This example will use the "PUT" HTTP request method
        //  (also known as HTTP verb)
        request.setValue("application/soap+xml", forHTTPHeaderField: "Content-Type")
        request.httpBody = Data(xmlStr.utf8)
        
        

        request.httpMethod = "POST"
        
    
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            print(data)
           
            if let getData = data{
              
                print(String(data: getData, encoding: String.Encoding.utf8))
                
                if let responseString = String(data: getData, encoding: String.Encoding.utf8) as? String{
                  
                    var res = ""
                    var count = 0
                    for c in responseString {
                        switch c {
                        case "<": count = count + 1; break;
                        case ">": count = count - 1; break;
                        default:
                            if count == 0 {
                                res += String(c)
                            }
                            break;
                        }
                    }
                    
                    print(res)
                }
                
                
            }
        }.resume()
    }
   
    
   
}
