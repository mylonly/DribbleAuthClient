//
//  DribbleClient+Shots.swift
//  DribbleOAuthClient
//
//  Created by 田祥根 on 16/7/30.
//  Copyright © 2016年 mylonly. All rights reserved.
//

import Foundation
import ReactiveCocoa
import Result
import SwiftyJSON

let ShotsList = "/shots"

public enum ShotsListType:String{
    case animated
    case attachments
    case debuts
    case playoffs
    case rebounds
    case teams
}

public enum ShotsListTimeFrame:String{
    case week,month,year,ever
}

public enum ShotsListSort:String{
    case comments,recent,views
}

public extension DribbleClient{

    public func fetchShotsList(list:ShotsListType?,timeFrame:ShotsListTimeFrame?,date:String?,sort:ShotsListSort?) -> SignalProducer<Array<Shot>,NSError>{
        var params = [String:String]()
        if let list = list{
            params["list"] = list.rawValue
        }
        if let timeFrame = timeFrame {
            params["timeframe"] = timeFrame.rawValue;
        }
        if let date = date {
            params["date"] = date
        }
        if let sort = sort {
            params["sort"] = sort.rawValue
        }
        return self.requestData(.GET, url: ShotsList, params: params).map{ json -> Array<Shot> in
            var shots:Array<Shot> = []
            for shotDict in json.arrayValue{
                let shot = Shot(shotDict)
                shots.append(shot)
            }
            return shots
        }
    }
    
    public func fetchShotWithID(_ shotID:Int)-> SignalProducer<Shot,NSError>{
        return self.requestData(.GET, url: ShotsList.appending(String.init(format: "/%d", shotID)), params: nil).map{ json -> Shot in
            let shot = Shot(json)
            return shot
        }
    }
}
