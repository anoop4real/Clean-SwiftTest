//
//  Album.swift
//  CleanSwiftTest
//
//  Created by anoop mohanan on 25/03/17.
//  Copyright © 2017 anoop mohanan. All rights reserved.
//

import UIKit

struct Album {
    
    var title:String
    var artist:String
    var url:String?
    var imageUrl:String?
    var thumbNailUrl:String?
    
    init?(albumDict:[String:String]){
    
        guard let title = albumDict["title"], let artist = albumDict["artist"] else {
            return nil
        }
        self.title = title
        self.artist = artist
        self.url = albumDict["url"]
        self.imageUrl = albumDict["image"]
        self.thumbNailUrl = albumDict["thumbnail_image"]
    }
}
