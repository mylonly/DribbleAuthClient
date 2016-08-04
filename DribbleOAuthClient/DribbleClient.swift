//
//  DribbleClient.swift
//  DribbleOAuthClient
//
//  Created by 田祥根 on 16/7/27.
//  Copyright © 2016年 mylonly. All rights reserved.
//

import Foundation
import ReactiveCocoa
import Alamofire
import SwiftyJSON

let AccessToken = "1f22c356632367cac87d697d8dd4367a48e5361ac4d20b5eddd6776dbe990c9c"
let BaseUrl = "https://api.dribbble.com/v1"

public class DribbleClient{
    
    public init(){}
    
    func requestData(_ method: Alamofire.Method,url:String,params:Dictionary<String,AnyObject>?) -> SignalProducer<JSON,NSError>{
        return SignalProducer{ observer,disposable in
            var paramsWithAccessToken = (params != nil ? params! : Dictionary())
            paramsWithAccessToken["access_token"] = AccessToken
            let request = Alamofire.request(method, BaseUrl+url, parameters:paramsWithAccessToken)
            .validate()
            .response(completionHandler: { request, response, responseObject, error in
                if let error = error{
                    observer.sendFailed(error)
                }
                else if let response = response{
                    if let responseObject = responseObject{
                        let json = JSON(data:responseObject)
                        observer.sendNext(json)
                        observer.sendCompleted()
                    }
                    else{
                        NSLog("Error:Received no response object for successful response \(response) from request \(request)")
                        observer.sendCompleted()
                    }
                }
                else{
                    fatalError()
                }
            })
            
            request.resume()
            disposable.add{
                request.cancel()
            }
        }
    }
}
