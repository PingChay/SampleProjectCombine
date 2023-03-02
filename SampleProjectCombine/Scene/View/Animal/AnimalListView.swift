//
//  AnimalListView.swift
//  SampleProjectCombine
//
//  Created by Saran Nonkamjan on 28/2/2566 BE.
//

import SwiftUI

struct AnimalListView<ViewModel: AnimalViewModel>: View {
    @ObservedObject private var animalViewModel: ViewModel

    init(animalViewModel: ViewModel) {
        self.animalViewModel = animalViewModel
    }

    var body: some View {
        List(animalViewModel.animal, id: \.name) { animal in
            NavigationLink {
                AnimalView(animal: animal)
            } label: {
                HStack {
                    Text(animal.name ?? "")
                    Spacer()
                    Text(animal.species ?? "")
                }
            }
        }
        .onAppear {
            animalViewModel.updateAnimal()
        }
    }
}

struct AnimalListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AnimalListView(animalViewModel: AnimalViewModelImpl())
        }
    }
}
