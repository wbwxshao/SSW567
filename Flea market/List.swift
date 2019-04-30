//
//  List.swift
//  College Flea Market
//
//  Created by godlikeMini on 3/2/19.
//  Copyright © 2019 godlikeMini. All rights reserved.
//

import Foundation
import UIKit
import Firebase

var imageUrl = ""

class List {
    let ref:DatabaseReference?
    var name : String
    var title : String
    var subtitle : String
    var time : String
    var puretime : Any
    var indexOfSelf : String
    var photo : UIImage = UIImage()
  
    init(name: String, title: String, subtitle: String, time: String, puretime: Any, indexOfSelf: String, photo: UIImage) {
        self.ref = nil
        self.name = name
        self.title = title
        self.subtitle = subtitle
        self.time = time
        self.puretime = puretime
        self.indexOfSelf = indexOfSelf
        self.photo = photo
    }
    typealias CompletionHandler = (_ success:Bool) -> Void
    init?(snapshot: DataSnapshot)
    {
        guard
        let value = snapshot.value as? [String: AnyObject],
        let url = value["0"] as? String,
        let name = value["name"] as? String,
        let title = value["title"] as? String,
        let subtitle = value["subtitle"] as? String,
        let time = value["time"] as? String,
        let puretime = value["puretime"] as? Any,
        let indexOfSelf = value["indexOfSelf"] as? String
        else{
            return nil
        }
        
        self.ref = snapshot.ref
        imageUrl = url
        self.name = name
        self.title = title
        self.subtitle = subtitle
        self.time = time
        self.puretime = puretime
        self.indexOfSelf = indexOfSelf
    }
    
    func getUrl() -> String
    {
        return imageUrl
    }
    
    func setPhoto(image: UIImage)
    {
        self.photo = image
    }
    
    func toAnyObject() -> Any{
        return [
            "name": name,
            "title": title,
            "subtitle": subtitle,
            "time": time,
            "puretime": puretime,
            "indexOfSelf": indexOfSelf,
            "photo": photo
        ]
    }
}
