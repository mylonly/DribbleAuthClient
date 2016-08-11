//
//  Profile.swift
//  DribbleOAuthClient
//
//  Created by 田祥根 on 16/8/11.
//  Copyright © 2016年 mylonly. All rights reserved.
//

import SwiftyJSON

public enum ProfileType:String{
    case Player,Team
}

public struct Links{
    var twitter:String?
    var web:String?
    init(_ data:JSON) {
        self.twitter = data["twitter"].string
        self.web = data["web"].string
    }
}

public class Profile {
    var id:Int?
    var name:String?
    var username:String?
    var htmlUrl:String?
    var avatarUrl:String?
    var bio:String?
    var location:String?
    var links:Links?
    var bucketsCount:Int?
    var commentsReceivedCount:Int?
    var followersCount:Int?
    var likesCount:Int?
    var likesReceivedCount:Int?
    var projectsCount:Int?
    var reboundsReceivedCount:Int?
    var shotsCount:Int?
    var teamsCount:Int?
    var canUploadShot:Bool?
    var type:ProfileType?
    var pro:Bool?
    var bucketsUrl:String?
    var followersUrl:String?
    var followingUrl:String?
    var likesUrl:String?
    var shotsUrl:String?
    var teamsUrl:String?
    var createdAt:String?
    var updatedAt:String?
    
    init(_ data:JSON) {
        self.id = data["id"].int
        self.name = data["name"].string
        self.username = data["username"].string
        self.htmlUrl = data["html_url"].string
        self.avatarUrl = data["avatar_url"].string
        self.bio = data["bio"].string
        self.location = data["location"].string
        self.links = Links(data["links"])
        self.bucketsCount = data["buckets_count"].int
        self.commentsReceivedCount = data["comments_received_count"].int
        self.followersCount = data["followers_count"].int
        self.likesCount = data["likes_count"].int
        self.likesReceivedCount = data["likes_received_count"].int
        self.projectsCount = data["projects_count"].int
        self.reboundsReceivedCount = data["rebounds_received_count"].int
        self.shotsCount = data["shots_count"].int
        self.teamsCount = data["teams_count"].int
        self.canUploadShot = data["can_upload_shot"].bool
        self.type = ProfileType(rawValue:data["type"].stringValue)
        self.pro = data["pro"].bool
        self.bucketsUrl = data["buckets_url"].string
        self.followersUrl = data["followers_url"].string
        self.followingUrl = data["following_url"].string
        self.likesUrl = data["likes_url"].string
        self.shotsUrl = data["shots_url"].string
        self.teamsUrl = data["teams_url"].string
        self.createdAt = data["created_at"].string
        self.updatedAt = data["updated_at"].string
    }
}
