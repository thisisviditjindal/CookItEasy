//
//  CookitEasyTests.swift
//  CookitEasyTests
//
//  Created by Vidit Jindal on 27/06/23.
//

import XCTest
@testable import CookitEasy

final class CookitEasyTests: XCTestCase {
    var api: Api!

    override func setUpWithError() throws {
        try super.setUpWithError()
        api = Api()
    }

    override func tearDownWithError() throws {
        api = nil
        try super.tearDownWithError()
    }

    func testMealbookInit() throws {
        let meal = mealbook(id: "1", name: "Test Meal", instructions: "Test Instructions", image: "Test Image", strIngredient1: "Ingredient 1", strIngredient2: "Ingredient 2", strIngredient3: "Ingredient 3", strIngredient4: "Ingredient 4", strIngredient5: "Ingredient 5", strIngredient6: nil, strIngredient7: nil, strIngredient8: nil, strIngredient9: nil, strIngredient10: nil, strIngredient11: nil, strIngredient12: nil, strIngredient13: nil, strIngredient14: nil, strIngredient15: nil, strIngredient16: nil, strIngredient17: nil, strIngredient18: nil, strIngredient19: nil, strIngredient20: nil, strMeasure1: "Measure 1", strMeasure2: "Measure 2", strMeasure3: "Measure 3", strMeasure4: "Measure 4", strMeasure5: "Measure 5", strMeasure6: nil, strMeasure7: nil, strMeasure8: nil, strMeasure9: nil, strMeasure10: nil, strMeasure11: nil, strMeasure12: nil, strMeasure13: nil, strMeasure14: nil, strMeasure15: nil, strMeasure16: nil, strMeasure17: nil, strMeasure18: nil, strMeasure19: nil, strMeasure20: nil)

        XCTAssertEqual(meal.id, "1")
        XCTAssertEqual(meal.name, "Test Meal")
        XCTAssertEqual(meal.instructions, "Test Instructions")
        XCTAssertEqual(meal.image, "Test Image")
        XCTAssertEqual(meal.strIngredient1, "Ingredient 1")
        XCTAssertEqual(meal.strIngredient2, "Ingredient 2")
        XCTAssertEqual(meal.strIngredient3, "Ingredient 3")
        XCTAssertEqual(meal.strIngredient4, "Ingredient 4")
        XCTAssertEqual(meal.strIngredient5, "Ingredient 5")
        XCTAssertEqual(meal.strMeasure1, "Measure 1")
        XCTAssertEqual(meal.strMeasure2, "Measure 2")
        XCTAssertEqual(meal.strMeasure3, "Measure 3")
        XCTAssertEqual(meal.strMeasure4, "Measure 4")
        XCTAssertEqual(meal.strMeasure5, "Measure 5")
    }


    func testApiLoadData() throws {
        let expectation = self.expectation(description: "Loading data")
        api.loaddata { meals in
            XCTAssertGreaterThan(meals.count, 0)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5.0, handler: nil)
    }

    func testPerformanceExample() throws {
        // Given
        let meal = mealbook(id: "1", name: "Test Meal", instructions: "Test Instructions", image: "Test Image", strIngredient1: "Ingredient 1", strIngredient2: "Ingredient 2", strIngredient3: "Ingredient 3", strIngredient4: "Ingredient 4", strIngredient5: "Ingredient 5", strIngredient6: nil, strIngredient7: nil, strIngredient8: nil, strIngredient9: nil, strIngredient10: nil, strIngredient11: nil, strIngredient12: nil, strIngredient13: nil, strIngredient14: nil, strIngredient15: nil, strIngredient16: nil, strIngredient17: nil, strIngredient18: nil, strIngredient19: nil, strIngredient20: nil, strMeasure1: "Measure 1", strMeasure2: "Measure 2", strMeasure3: "Measure 3", strMeasure4: "Measure 4", strMeasure5: "Measure 5", strMeasure6: nil, strMeasure7: nil, strMeasure8: nil, strMeasure9: nil, strMeasure10: nil, strMeasure11: nil, strMeasure12: nil, strMeasure13: nil, strMeasure14: nil, strMeasure15: nil, strMeasure16: nil, strMeasure17: nil, strMeasure18: nil, strMeasure19: nil, strMeasure20: nil)

        // When & Then
        measure {
            _ = meal.image
        }
    }

}

