//
//  RepositoryInterfaces.swift
//  ArchitectureAndBiolerPlate
//
//  Created by Vineet Rai on 12/07/23.
//

import Foundation

protocol ArticleRepositoryProtocol {
    
    func getEntity(
        completion: @escaping(Resource<[Article]>) -> Void
    )
}

