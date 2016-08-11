//
//  DOCShot.swift
//  DribbleOAuthClient
//
//  Created by 田祥根 on 16/8/4.
//  Copyright © 2016年 mylonly. All rights reserved.
//

import SwiftyJSON

public struct ShotImages{
    var hidpi:String?
    var normal:String?
    var teaser:String?
    init(_ data:JSON) {
        self.hidpi = data["hidpi"].string
        self.normal = data["normal"].string
        self.teaser = data["teaser"].string
    }
}

public class Shot{
    var id:Int?
    var title:String?
    var description:String?
    var width:Int?
    var height:Int?
    var images:ShotImages?
    var viewsCount:Int?
    var likesCount:Int?
    var commentsCount:Int?
    var attachmentsCount:Int?
    var reboundsCount:Int?
    var bucketsCount:Int?
    var createdAt:String?
    var updatedAt:String?
    var htmlUrl:String?
    var attachmentsurl:String?
    var bucketsUrl:String?
    var commentsUrl:String?
    var likesUrl:String?
    var projectsUrl:String?
    var reboundsUrl:String?
    var animated:Bool?
    var tags:Array<String>?
    var user:Profile?
    var team:Profile?
    
    init(_ data:JSON) {
        self.id = data["id"].int
        self.title = data["title"].string
        self.description = data["description"].string
        self.width = data["width"].int
        self.height = data["height"].int
        self.images = ShotImages(data["images"])
        self.viewsCount = data["views_count"].int
        self.likesCount = data["likes_count"].int
        self.commentsCount = data["comments_count"].int
        self.attachmentsCount = data["attachments_count"].int
        self.reboundsCount = data["rebounds_count"].int
        self.bucketsCount = data["buckets_count"].int
        self.createdAt = data["created_at"].string
        self.updatedAt = data["updated_at"].string
        self.htmlUrl = data["html_url"].string
        self.attachmentsurl = data["attachments_url"].string
        self.bucketsUrl = data["buckets_url"].string
        self.commentsUrl = data["comments_url"].string
        self.likesUrl = data["likes_url"].string
        self.projectsUrl = data["projects_url"].string
        self.reboundsUrl = data["rebounds_url"].string
        self.animated = data["animated"].bool
        self.tags = data["tags"].object as? Array
        self.user = Profile(data["user"])
        self.team = Profile(data["team"])
    }
}
