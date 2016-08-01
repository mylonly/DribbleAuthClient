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

let AccessToken = "1f22c356632367cac87d697d8dd4367a48e5361ac4d20b5eddd6776dbe990c9c"
let BaseUrl = "https://api.dribbble.com/v1"

public class DribbleClient{
    
    func requestData(_ method: Alamofire.Method,url:String,params:Dictionary<String,AnyObject>?) -> SignalProducer<AnyObject,NSError>{
        return SignalProducer{ observer,disposable in
            var paramsWithAccessToken = (params != nil ? params! : Dictionary())
            paramsWithAccessToken["access_token"] = AccessToken
            let request = Alamofire.request(Method.GET, BaseUrl+url, parameters:paramsWithAccessToken)
            .validate()
            .responseJSON(completionHandler: { response in
                if response.result.isFailure{
                    observer.sendFailed(response.result.error!)
                }
                else{
                    observer.sendNext(response.result.value!)
                    observer.sendCompleted()
                }
            })
            
            request.resume()
            disposable.add{
                request.cancel()
            }
        }
    }
}
