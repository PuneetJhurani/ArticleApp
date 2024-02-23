//
//  MocApiManager.swift
//  ArchitectureAndBiolerPlate
//
//  Created by Puneet jhurani  on 14/09/23.
//

import Foundation

class MockApiManager: NetworkProtocol {
    
    func getAnyEntity(completion: @escaping ([Article]?, ResponseException?) -> Void) {
        let dummyString = """
       {
        "id": 1,
        "title": "AnyTitle",
        "byline": "By Puneet Jhurani",
        "abstract": "This is article created purley for demo purposes",
        "phone": "1-770-736-8031 x56442",
        "website": "hildegard.org",
        "company": {
          "name": "Romaguera-Crona",
          "catchPhrase": "Multi-layered client-server neural-net",
          "bs": "harness real-time e-markets"
          }
      }
      """
        do {
            var user = try Article.init(json: dummyString.data(using: String.Encoding.utf8))
            completion([user], nil)
        }catch{
            print("Inside Exception")
        }
        
    }
}
