//
//  TodoListViewModel.swift
//  ArchitectureAndBiolerPlate
//
//  Created by Puneet jhurani  on 24/07/23.
//

import Foundation
import SwiftUI


class ArticleViewModel: ObservableObject{
    
    @Published var articles = [Article]()
    @Published var isLoading = true
    @Published var errorMessage = ""
    private var repo: ArticleRepositoryProtocol?
    
    private var analyticsHelper: AnalyticsHelper?
    init(
        repository: ArticleRepositoryProtocol?,
        analyticsHelper: AnalyticsHelper?
    ) {
        self.repo = repository
        self.analyticsHelper = analyticsHelper
    }
    
    func fetchArticleList() {
        self.repo?.getEntity(completion: {[weak self] resource in
            print(resource)
            DispatchQueue.main.async {
                
                if resource.status == .success {
                    self?.articles = resource.data ?? []
                    self?.isLoading = false
                }else {
                    self?.isLoading = false
                    self?.errorMessage = resource.message ?? ""
                    
                }
            }
        })
    }
}



