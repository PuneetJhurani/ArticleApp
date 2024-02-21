//
//  MocRepository.swift
//
//
//  Created by Puneet jhurani  on 12/09/23.
//
//: {
import Foundation

class MockRepository: ArticleRepositoryProtocol {
    
    func getEntity(
        completion: @escaping (Resource<[Article]>) -> Void
    ) {
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
            try completion(
                Resource(
                    successData: [Article(
                        json: dummyString.data(
                            using: String.Encoding.utf8
                        )
                    )]
                )
            )
            
        } catch {
            completion(
                Resource(
                    failureData: [],
                    errorCode: 100,
                    message: "Faiure"
                )
            )
        }
    }
}
