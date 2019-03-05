//
//  WebserviceManager.swift
//  TMDB
//
//  Created by Monali on 05/03/19.
//  Copyright © 2019 Monali. All rights reserved.
//

import UIKit
import Alamofire

typealias JsonDictionay = [String : Any]

enum  ItemDataResponse {
    case success(result: JsonDictionay)
    case failure
    case notConnectedToInternet
}

enum ResponseStatusCode: Int {
    case success = 200
}

class WebserviceManager: NSObject {
    
    
//    func getMovieList(params : JsonDictionay? = [:], url : String, completion : @escaping(ItemDataResponse) -> Void) {
//        
//        let baseUrl = URL(fileURLWithPath: url)
//        let headers = [String : String]()
//        let params = [String : String]()
//        
//        Alamofire.request(baseUrl, method: .get, parameters: params, encoding: JSONEncoding.default, headers: headers).response { (response) in
//            
//            guard let urlresponse = response.response else {
//                return
//            }
//            
//           // completion(response)
//    
//            print(response)
//        }
//    }
    
    func getMovieList(url1 : String, completion : @escaping([String: Any]?, Error?) -> Void) {
        
        let strUrl = URL(string: url1)!
        let headers = [String : String]()
        let params = [String : String]()

        
        //create the session object
        let session = URLSession.shared
        
        //now create the Request object using the url object
        var request = URLRequest(url: strUrl)
        request.httpMethod = "GET" //set http method as POST
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted) // pass dictionary to data object and set it as request body
        } catch let error {
            print(error.localizedDescription)
            completion(nil, error)
        }
        
        //HTTP Headers
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        //create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            
            guard error == nil else {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, NSError(domain: "dataNilError", code: -100001, userInfo: nil))
                return
            }
            
            do {
                //create json object from data
                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else {
                    completion(nil, NSError(domain: "invalidJSONTypeError", code: -100009, userInfo: nil))
                    return
                }
                print(json)
                completion(json, nil)
            } catch let error {
                print(error.localizedDescription)
                completion(nil, error)
            }
        })
        
        task.resume()


            
        }
        
}
