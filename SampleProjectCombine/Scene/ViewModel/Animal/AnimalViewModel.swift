//
//  AnimalViewModel.swift
//  SampleProjectCombine
//
//  Created by Saran Nonkamjan on 28/2/2566 BE.
//

import Foundation
import Combine
import Moya

protocol AnimalViewModel: ObservableObject {
    var animal: [Animal] { get }

    func updateAnimal()
}

final class AnimalViewModelImpl: ObservableObject, AnimalViewModel {
    private var dispose: Set<AnyCancellable> = .init()

    private let getAnimalsUseCase: GetAnimalsUseCase

    @Published private(set) var animal: [Animal] = []

    init(animal: [Animal] = [],
         getAnimalsUseCase: GetAnimalsUseCase = GetAnimalsUseCaseImpl()) {
        self.animal = animal
        self.getAnimalsUseCase = getAnimalsUseCase
    }

    func updateAnimal() {
        getAnimalsUseCase
            .execute()
            .sink { [weak self] completion in
                guard let self = self else { return }

                switch completion {
                    case let .failure(error):
                        break
                    case .finished:
                        break
                }
            } receiveValue: { [weak self] animals in
                guard let self = self else { return }

                self.animal = animals
            }
            .store(in: &dispose)
    }
}
