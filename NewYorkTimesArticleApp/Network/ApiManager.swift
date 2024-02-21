//
//  Network.swift
//  ArchitectureAndBiolerPlate
//
//  Created by Puneet jhurani  on 07/07/23.
//

import Foundation
import SwiftUI


let connectionTimeoutInMillis = 30 * 1000

class ApiManager: NetworkProtocol {
    
    var  baseUrl = "https://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections"
    private var session: NetworkClient?
    var preferences: AppSettings?
    private static var instance : ApiManager?
    
    private init(
        session: NetworkClient?,
        prefs: AppSettings?
    ) {
        self.session = session
        self.preferences = prefs
    }
    
    static func getInstance(
        session: NetworkClient?,
        preferences: AppSettings?
    ) -> ApiManager {
        if let instance = self.instance {
            return instance
        } else{
            self.instance = ApiManager(
                session: session ?? NetworkClient(headers: [:],
                                                  timeout: UInt(connectionTimeoutInMillis)),
                prefs: preferences
            )
            return self.instance!
        }
    }
    
    func getAnyEntity(
        completion: @escaping([Article]?, ResponseException?) -> Void) {
            
            var responselist : ApiResponse?
            
            if var urlComponents = URLComponents(string: baseUrl + "/7.json"){
                
                urlComponents.queryItems = [
                    URLQueryItem(name: "api-key", value:ApiKeys.mostViewed )
                ]
                guard let url = urlComponents.url else {
                    return
                }
                
                let dataTask = session?.get(
                    url: url,
                    headers: [:]) { [weak self] data,response,error in
                        
                        if error == nil {
                            do {
                                responselist = try  Article().decodeArticleList(json: data)
                                completion(responselist?.results,nil)
                            }catch {
                            
                                completion(nil,ResponseException(errorCode: 0, message: error.localizedDescription, url: url))
                            }
                        }else {
                            
                            if let urlError = error as? URLError {
                                completion(nil,ResponseException(errorCode: urlError.errorCode, message: urlError.localizedDescription, url: url))
                            }else {
                                completion(nil,ResponseException(errorCode: 0, message: (error?.localizedDescription)!, url: url))
                            }
                        }
                    }
                dataTask?.resume()
            }else {
                print("url not correct")
            }
        }
}


struct ResponseException: Error {
    
    var errorCode: Int?
    var message: String?
    var url: URL?
    
    init(errorCode: Int, message: String, url: URL) {
        self.errorCode = errorCode
        self.message = message
        self.url = url
    }
    
}

