//
//  SessionManager.swift
//  QuintypeFramework
//
//  Created by Arjun P A on 22/05/16.
//  Copyright © 2016 Arjun P A. All rights reserved.
//

import UIKit
import Alamofire
class SessionManager: NSObject {
    
   
    
    internal lazy var manager:Manager = {
        var sessionConfig:NSURLSessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
        return Manager.init(configuration: sessionConfig, delegate: Manager.SessionDelegate(), serverTrustPolicyManager: nil)
     }()
    
    
}