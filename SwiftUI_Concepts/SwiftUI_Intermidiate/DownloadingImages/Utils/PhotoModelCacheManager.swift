//
//  PhotoModelCacheManager.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 11/03/22.
//

import Foundation
import UIKit

class PhotoModelCacheManager {
    static let instance = PhotoModelCacheManager() // singleton
    private init() { }
    
    var photoCache: NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString, UIImage>()
        cache.countLimit = 200
        cache.totalCostLimit = 1024 * 1024 * 200
        return cache
    }()
    
    func add(image: UIImage, name: String) {
        photoCache.setObject(image, forKey: name as NSString)
        print("Added to cache")
    }
    
    func get(name: String) -> UIImage? {
        return photoCache.object(forKey: name as NSString)
    }
}
