//
//  APIManager.swift
//  SeidorTest
//
//  Created by Matías Contreras Selman on 02-05-18.
//  Copyright © 2018 Matias Contreras. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import SVProgressHUD

class APIManager: NSObject {
    static let shared = APIManager()
    let manager = Alamofire.SessionManager.default
    
    override init() {
        super.init()
        manager.session.configuration.timeoutIntervalForRequest = 3
    }
    
    func getMovies(url: String, completition: @escaping ((_ responseObject: JSON) -> Void), failure: @escaping ((_ error: Error) -> Void)) {
        manager.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON{ response in
            print(response)
            
            switch (response.result) {
            case .success(let value):
                let json = JSON(value)
                
                if json["success"].exists(){
                    if !json["success"].boolValue{
                        SVProgressHUD.showError(withStatus: json["status_message"].stringValue)
                        return
                    }
                }
                
                completition(json)
                
                break
            case .failure:
                if let error = response.error{
                    SVProgressHUD.showError(withStatus: response.error?.localizedDescription)
                    failure(error)
                }
               
                break
            }
            
        }
        
    }
}
