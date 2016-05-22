//
//  NetworkRequestsManager.swift
//  QuintypeFramework
//
//  Created by Arjun P A on 22/05/16.
//  Copyright © 2016 Arjun P A. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
public class NetworkRequestsManager: NSObject {
    static let sharedManager:NetworkRequestsManager = NetworkRequestsManager.init()
    private lazy var sessionManager:SessionManager = SessionManager.init()
    
    public func getToURL(url:String,withParameters parameters:[String:AnyObject]?,andSuccessHandler successHandler:(JSON?)->Void, andFailureHandler failureHandler:(NSError)->Void){
        
        let manager:Manager = sessionManager.manager
        
        manager.request(.GET, url, parameters: parameters, encoding: .URL, headers: nil)
        .responseJSON { (response) in
            if response.result.isSuccess{
                
                if let responseData = response.data{
                    
                    successHandler(JSON.init(data:responseData))
                }
            }
            
            else{
                failureHandler(response.result.error!)
            }
        }
    }
    
    private override init(){
         super.init()
    }
}
