//
//  GetAnimalsUseCase.swift
//  SampleProjectCombine
//
//  Created by Saran Nonkamjan on 28/2/2566 BE.
//

import Foundation
import Combine
import Moya

protocol GetAnimalsUseCase {
    func execute() -> AnyPublisher<[Animal], MoyaError>
}

final class GetAnimalsUseCaseImpl: GetAnimalsUseCase {
    private let animalRepository: AnimalRepository

    init(animalRepository: AnimalRepository = AnimalRepositoryImpl()) {
        self.animalRepository = animalRepository
    }

    func execute() -> AnyPublisher<[Animal], MoyaError> {
        return animalRepository
            .getAnimals()
            .eraseToAnyPublisher()
    }
}
