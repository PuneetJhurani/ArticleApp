//
//  TodoListModule.swift
//  ArchitectureAndBiolerPlate
//
//  Created by Puneet jhurani  on 28/07/23.
//

import Foundation
import Swinject

class ArticleListModule: Assembly {
    func assemble(container: Container) {
        container.register(ArticleViewModel.self) { r  in
            let repoInstance = assembler.resolver.resolve(ArticleRepositoryProtocol.self)
            let analyticsHelper = assembler.resolver.resolve(AnalyticsHelper.self)
            return ArticleViewModel(
                repository: repoInstance,
                analyticsHelper: analyticsHelper
            )
        }
    }
}

let articleListModule = Assembler([ArticleListModule()])
