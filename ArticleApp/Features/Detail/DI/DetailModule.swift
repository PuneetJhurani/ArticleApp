//
//  CounterList.swift
//  ArchitectureAndBiolerPlate
//
//  Created by Puneet jhurani  on 01/08/23.
//


import Foundation
import Swinject

class DetailModule : Assembly {
    func assemble(container: Container) {
        container.register(DetailViewModel.self) { res  in
           
            let repoInstance = assembler.resolver.resolve(
                ArticleRepositoryProtocol.self
            )
            
            let preferences = assembler.resolver.resolve(
                AppSettings.self
            )
            return DetailViewModel(repository: repoInstance, preferences: preferences)
        }
    }
}

let counterAssembler = Assembler([DetailModule()])
