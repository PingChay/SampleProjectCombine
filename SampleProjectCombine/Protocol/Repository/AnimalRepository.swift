//
//  AnimalRepository.swift
//  SampleProjectCombine
//
//  Created by Saran Nonkamjan on 28/2/2566 BE.
//

import Moya
import Combine

protocol AnimalRepository {
    func getAnimals() -> AnyPublisher<[Animal], MoyaError>
}

final class AnimalRepositoryImpl: AnimalRepository {
    private let provider: MoyaProvider<AnimalProvider>

    init(provider: MoyaProvider<AnimalProvider> = .init(plugins: [VerbosePlugin(verbose: true)])) {
        self.provider = provider
    }

    func getAnimals() -> AnyPublisher<[Animal], MoyaError> {
        return provider
            .requestPublisher(.getAnimals)
            .map([Animal].self)
            .eraseToAnyPublisher()
    }
}
