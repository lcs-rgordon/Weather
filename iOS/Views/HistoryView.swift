//
//  HistoryView.swift
//  iOS
//
//  Created by Russell Gordon on 2021-10-02.
//

import SwiftUI

struct HistoryView: View {
    
    @ObservedObject var viewModel: WeatherViewModel

    var body: some View {
        // Show the list of questions and responses
        List(viewModel.history.reversed()) { prediction in
            VStack(alignment: .leading) {
                Text("\(prediction.condition.description)")
                    .font(.title)

                Text("\(String(format: "%.1f", arguments: [prediction.temperature])) °C")
                    .font(.largeTitle)
                    .bold()
                
                Text("\(prediction.feel)")
                    .font(.title3)
            }
        }
        .padding()
        .navigationTitle("History")

    }
}

struct HistoryView_Previews: PreviewProvider {

    // Create an instance of the view model to populate data for the preview window
    // NOTE: Property must be declared as static to use with Xcode Previews, a requirement of Xcode's design
    @StateObject private static var viewModel = WeatherViewModel()
    
    static var previews: some View {
        // NOTE: Navigation view is needed to present the title that shows in the actual UI
        //       Recall that in the app entry point, we wrap the HistoryView instance in a NavigationView structure.
        NavigationView {
            HistoryView(viewModel: viewModel)
        }
    }
    
}
