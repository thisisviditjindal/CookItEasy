//
//  ContentView.swift
//  CookitEasy
//
//  Created by Vidit Jindal on 27/06/23.
//

import SwiftUI

struct ContentView: View {
    @State var meals = [mealbook]()
    @ObservedObject var viewModel = Api1()
    var body: some View {
        NavigationView {
            List {
                ForEach(meals) { meal in
                    NavigationLink(destination:  DetailView(mealID: meal.id, viewModel: viewModel)) {
                        Text("\(meal.name)")
                    }
                }
            }
            .onAppear() {
                Api().loaddata { (meals) in
                    self.meals = meals
                }
                viewModel.fetchDessertMeals()
            }
            .navigationTitle("Deserts")
        }
    }
 
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
