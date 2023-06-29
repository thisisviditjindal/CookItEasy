//
//  Mealbook.swift
//  CookitEasy
//
//  Created by Vidit Jindal on 27/06/23.
//

import Foundation

struct mealbook: Codable, Identifiable{
    var id: String
    var name: String
    var instructions: String?
    var image: String?
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case instructions = "strInstructions"
        case image = "strMealThumb"
        case strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5, strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10, strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15, strIngredient16, strIngredient17, strIngredient18, strIngredient19, strIngredient20
        case strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5, strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10, strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15, strMeasure16, strMeasure17, strMeasure18, strMeasure19, strMeasure20
    }
    let strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5, strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10, strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15, strIngredient16, strIngredient17, strIngredient18, strIngredient19, strIngredient20: String?
    let strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5, strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10, strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15, strMeasure16, strMeasure17, strMeasure18, strMeasure19, strMeasure20: String?
    var Ingredients: [String] {
        let array = [strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5, strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10, strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15, strIngredient16, strIngredient17, strIngredient18, strIngredient19, strIngredient20]
        return array.compactMap{$0}.filter{!$0.isEmpty}
    }
    var measurement: [String] {
        let array = [strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5, strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10, strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15, strMeasure16, strMeasure17, strMeasure18, strMeasure19, strMeasure20]
        return array.compactMap{$0}.filter{!$0.isEmpty}
    }
   
}

struct Meals: Codable {
    let meals: [mealbook]
}

class Api: ObservableObject {
    @Published var meals = [mealbook]()
    func loaddata(completion:@escaping ([mealbook]) -> ()) {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else {
            print("Invalid url....")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            guard let data = data else {
                print("No data received.")
                return
            }
            do {
                let meal = try JSONDecoder().decode(Meals.self, from: data)
                //print(meal)
                DispatchQueue.main.async {
                    completion(meal.meals)
                }
            } catch let decodeError {
                print("Decoding Error: \(decodeError)")
            }
            
        }.resume()
    }
}
class Api1: ObservableObject {
    @Published var meals = [mealbook]()
    @Published var mealDetails = [String: mealbook]()

    func fetchDessertMeals() {
        Api().loaddata { (meals) in
            DispatchQueue.main.async {
                self.meals = meals
            }
        }
    }
    func fetchMeal(id: String) {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(id)") else {
            print("Invalid url")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            guard let data = data else {
                print("No data received.")
                return
            }
            do {
                let meal = try JSONDecoder().decode(Meals.self, from: data)
                DispatchQueue.main.async {
                    self.mealDetails[id] = meal.meals.first
                }
            } catch let error1 {
                print("Error: \(error1)")
            }
        }.resume()
    }
    func meal(withID id: String) -> mealbook? {
        mealDetails[id]
    }
}



