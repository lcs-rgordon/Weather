//
//  main.swift
//  Weather
//
//  Created by Russell Gordon on 2021-09-30.
//

import Foundation

// MARK: Global variables (variables used below)

// Create an empty list to keep track of predictions made
var history: [Prediction] = []

// MARK: Functions

// Show menu and handle selection
func menu() {
    
    // Loop continuously until user elects to quit
    while true {
        
        print("""
            Menu
            ----
            1 - Show new prediction
            2 - See history of predictions given
            Q - QUIT PROGRAM
            
            Your choice (1/2/Q)?
            """)
        
        // Get user input
        let input = readLine()!
        
        // Handle input
        switch input {
        case "1":
            // Show a new prediction
            showPrediction()
        case "2":
            // See history
            continue
        case "q", "Q":
            // QUIT
            exit(0)
        default:
            continue
        }
        
    }


}

// Show a prediction
func showPrediction() {

    // Generate a weather prediction
    let prediction = WeatherPredictionGenerator.getPrediction()

    // Save the prediction
    history.append(prediction)

    // Show the prediction
    print("")
    print("Current conditions are \(prediction.condition.description.lowercased()) with a temperature of \(String(format: "%.1f", arguments: [prediction.temperature])) °C.")

    print("That's \(prediction.feel.lowercased())!")
    print("")

}

// Show the history of predictions


// MARK: Main part of program
print("""
    WEATHER
    =======

    """)

menu()

