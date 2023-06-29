import SwiftUI

struct DetailView: View {
    let mealID: String
    @ObservedObject var viewModel: Api1
    
    var body: some View {
        VStack {
            if let meal = viewModel.meal(withID: mealID) {
                
                ScrollView {
                    AsyncImage(url: URL(string: meal.image ?? "")) { image in
                      image
                        .resizable()
                        .scaledToFit()
                    } placeholder: {
                      Image(systemName: "photo.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 300)
                        .foregroundColor(.purple)
                        .opacity(0.5)
                    }
                    .padding(2)
                    .ignoresSafeArea(edges: .top)
                    Text(meal.name)
                        .navigationTitle(meal.name)
                        .navigationBarTitleDisplayMode(.inline)
                    VStack(alignment: .leading){
                        Text("Instructions")
                            .bold()
                            .font(.title2)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading,10)
                            .padding(.top,4)
                        Text(meal.instructions ?? "Sample")
                            .padding(.leading,10)
                            .padding(.top, 2)
                    }
                    Spacer()
                    Spacer()
                    VStack (alignment: .leading){
                        Text("Ingredients - Measurements")
                            .bold()
                            .font(.title3)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading,10)
                            .padding(.bottom,5)
                        ForEach(meal.Ingredients.indices, id: \.self) {i in
                            Text("\(meal.Ingredients[i]) - \(meal.measurement[i])")
                                .padding(.leading,10)
                                .padding(.bottom, 5)
                        }
                    }
                    .padding(.bottom,10)
                }
            }
        }
        .onAppear() {
            viewModel.fetchMeal(id: mealID)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(mealID: "52772", viewModel: Api1())
    }
}
