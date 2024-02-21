//
//  Todo.swift
//  ArchitectureAndBiolerPlate
//
//  Created by Puneet jhurani  on 28/07/23.
//

import Foundation


struct ApiResponse : Codable {
    var status : String?
    var num_results: Int?
    var results : [Article]?
}


struct Article: Identifiable,Codable{

    var id : Int?
    var url : String?
    var byline : String?
    var title : String?
    var publishedDate : String?
    var abstract : String?
    var media : [Media]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case url
        case byline
        case title
        case publishedDate = "published_date"
        case abstract
        case media
        
    }
    
    init() {
        print("init Without parameters")
    }
    
    init(json : Data?) throws {
        let decodedResponse = try JSONDecoder().decode(Article.self, from: json!)
        print(decodedResponse)
        self.id = decodedResponse.id
        self.url  = decodedResponse.url
        self.byline = decodedResponse.byline
        self.title = decodedResponse.title
        self.abstract = decodedResponse.abstract
        self.media = decodedResponse.media
    }
    
    func decodeArticleList(json : Data?) throws -> ApiResponse {
        let decodedResponse = try JSONDecoder().decode(ApiResponse.self, from: json!)
        
        return decodedResponse
    }
}


struct Media : Codable {
    var type : String?
    var subType : String?
    var caption : String?
}

