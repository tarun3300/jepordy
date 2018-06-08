//
//  categorySingleton.swift
//  Jeopardy
//
//  Created by TARUN GUDELA on 6/8/18.
//  Copyright © 2018 Mayago. All rights reserved.
//

import Foundation
class Singleton: NSObject {
    
    // MARK: - Shared Instance
    
    var AllcategoryObject = [[String: AnyObject]]()
    
    static let sharedInstance: Singleton = {
        let instance = Singleton()
        // setup code
        return instance
    }()
    
    // MARK: - Initialization Method
    
    override init() {
        super.init()
    }
}
