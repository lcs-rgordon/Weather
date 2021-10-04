//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Russell Gordon on 2021-09-30.
//

import Foundation

class WeatherViewModel: ObservableObject {
    
    // Create an empty list to keep track of predictions made
    @Published var history: [Prediction] = []
    
    init() {
        
        // Generate several predictions at random, this ensures some data is always showing when the app opens
        for _ in 1...3 {
            
            // We don't need to use the result of these predictions right now, so we do not assign to any variable or constant, instead we "throw away" the result using the underscore syntax shown
            _ = self.providePrediction()
        }
        
    }

    // Give a predicction
    func providePrediction() -> Prediction {
        
        // Generate a weather prediction
        let prediction = WeatherPredictionGenerator.getPrediction()

        // Save the prediction
        history.append(prediction)

        // Return the prediction
        return prediction
        
    }
    
}
