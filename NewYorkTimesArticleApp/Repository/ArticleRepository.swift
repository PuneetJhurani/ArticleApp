//
//  any_repository.swift
//  ArchitectureAndBiolerPlate
//
//  Created by Puneet on 12/07/23.
//  To be changed to Async await in future versions

import Foundation

class ArticleRepository: BaseRepository, ArticleRepositoryProtocol {
    
    var apiManager: NetworkProtocol?
    
    init(apiManager: NetworkProtocol?) {
        self.apiManager = apiManager
    }
    //  To be changed to Async await in future versions
    func getEntity(completion: @escaping(Resource<[Article]>) -> Void) {
        
        self.apiManager?.getAnyEntity(
            completion:  { [weak self] anyEntity, error in
                self?.handleApiCall(
                    response: anyEntity,
                    error: error,
                    completion: completion
                )
            }
        )
    }
}
