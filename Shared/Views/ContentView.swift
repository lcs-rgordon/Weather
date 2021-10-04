//
//  ContentView.swift
//  iOS
//
//  Created by Russell Gordon on 2021-10-02.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: WeatherViewModel
    
    @State var temperature: Double
    
    @State var feel: String

    @State var conditions: String
    
    var body: some View {

        VStack {
            
            Spacer()
            
            Text("\(conditions)")
            // Use compiler directives to adjust the size of the Text view on different platforms
            // READ MORE: https://www.swiftbysundell.com/articles/using-compiler-directives-in-swift/
            #if os(iOS)
                // Compiled only for the iOS target
                .font(.title)
            #else
                // watchOS target gets this
                .font(.title2)
            #endif

            Text("\(String(format: "%.1f", arguments: [temperature])) °C")
                .font(.largeTitle)
                .bold()
            
            Text("\(feel)")
                .font(.title3)
            
            Spacer()
            
            Button {
                
                // Get a new prediction from the view model
                let prediction = viewModel.providePrediction()
                
                // Populate state variables so the user interface updates
                temperature = prediction.temperature
                feel = "That's \(prediction.feel.lowercased())."
                conditions = prediction.condition.description
                
            } label: {
                Text("Get New Prediction")
            }
            
            Spacer()

            
        }
        .navigationTitle("Current")
        
    }
}

struct ContentView_Previews: PreviewProvider {
    
    // Create an instance of the view model to populate data for the preview window
    // NOTE: Property must be declared as static to use with Xcode Previews, a requirement of Xcode's design
    @StateObject private static var viewModel = WeatherViewModel()
    
    static var previews: some View {
        NavigationView {
            ContentView(viewModel: viewModel,
                        temperature: viewModel.history.last!.temperature,
                        feel: viewModel.history.last!.feel,
                        conditions: viewModel.history.last!.condition.description)
        }
    }
}
