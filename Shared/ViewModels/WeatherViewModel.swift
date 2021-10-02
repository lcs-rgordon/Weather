//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Russell Gordon on 2021-09-30.
//

import Foundation

class WeatherViewModel {
    
    // Create an empty list to keep track of predictions made
    var history: [Prediction] = []

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
