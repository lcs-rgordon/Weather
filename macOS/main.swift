//
//  main.swift
//  Weather
//
//  Created by Russell Gordon on 2021-09-30.
//

import Foundation

// Create empty list to keep track of predictions made
var history: [Prediction] = []

// Generate a weather prediction
let prediction = WeatherPredictionGenerator.getPrediction()

// Save the prediction
history.append(prediction)

// Show the prediction
print("Current conditions are \(prediction.condition.description.lowercased()) with a temperature of \(String(format: "%.1f", arguments: [prediction.temperature])) °C.")

print("That's \(prediction.feel.lowercased())!")
