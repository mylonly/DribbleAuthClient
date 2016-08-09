//
//  DOCShot.swift
//  DribbleOAuthClient
//
//  Created by 田祥根 on 16/8/4.
//  Copyright © 2016年 mylonly. All rights reserved.
//

import SwiftyJSON

public class Shot{
    var id:Int?
    var title:String?
    var description:String?
    var width:Int?
    var height:Int?
    var images:Dictionary<String,String> = [:]
    var viewsCount:Int?
    var likesCount:Int?
    var commentsCount:Int?
    var attachmentsCount:Int?
    var reboundsCount:Int?
    var bucketsCount:Int?
    var createdAt:Date?
    var updatedAt:Date?
}
