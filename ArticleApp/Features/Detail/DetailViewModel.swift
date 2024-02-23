//
//  DeatilViewModel.swift
//  ArchitectureAndBiolerPlate
//
//  Created by Puneet jhurani  on 01/08/23.
//

import Foundation


//
//  TodoListViewModel.swift
//  ArchitectureAndBiolerPlate
//
//  Created by Puneet jhurani  on 24/07/23.
//

import Foundation
import SwiftUI


class DetailViewModel: ObservableObject{
        
    private var repo: ArticleRepositoryProtocol?
    private var preferences : AppSettings?
    
    init(
        repository: ArticleRepositoryProtocol?,
         preferences: AppSettings?
    ) {
        self.repo = repository
        self.preferences = preferences
    }
}




