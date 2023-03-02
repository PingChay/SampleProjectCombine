//
//  AnimalView.swift
//  SampleProjectCombine
//
//  Created by Saran Nonkamjan on 28/2/2566 BE.
//

import SwiftUI

struct AnimalView: View {
    private let animal: Animal

    init(animal: Animal) {
        self.animal = animal
    }

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Species:")
                    .fontWeight(.bold)
                Text(animal.species ?? "")
                Spacer()
            }
            HStack {
                Text("Like:")
                    .fontWeight(.bold)
                ForEach(animal.foods?.likes ?? [], id: \.self) { like in
                    Text(like)
                }
                Spacer()
            }
            HStack {
                Text("Dislikes:")
                    .fontWeight(.bold)
                ForEach(animal.foods?.dislikes ?? [], id: \.self) { dislike in
                    Text(dislike)
                }
                Spacer()
            }
            Spacer()
        }
        .padding(.leading, 16)
        .navigationTitle(animal.name ?? "-")
    }
}

struct AnimalView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AnimalView(animal: .init(name: "Meowsy",
                                     species: "cat",
                                     foods: .init(likes: ["tuna",
                                                          "catnip"],
                                                  dislikes: ["ham",
                                                             "zucchini"])))
        }
    }
}
