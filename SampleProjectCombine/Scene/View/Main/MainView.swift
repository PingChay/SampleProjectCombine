//
//  MainView.swift
//  SampleProjectCombine
//
//  Created by Saran Nonkamjan on 28/2/2566 BE.
//

import SwiftUI

struct MainView<ViewModel: AnimalViewModel>: View {
    @StateObject private var animalViewModel: ViewModel

    init(animalViewModel: ViewModel = AnimalViewModelImpl()) {
        _animalViewModel = .init(wrappedValue: animalViewModel)
    }

    var body: some View {
        NavigationView {
            AnimalListView(animalViewModel: animalViewModel)
                .navigationTitle("Animals")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
