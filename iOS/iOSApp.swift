//
//  iOSApp.swift
//  iOS
//
//  Created by Russell Gordon on 2021-10-02.
//

import SwiftUI

@main
struct iOSApp: App {
    var body: some Scene {
        WindowGroup {
            
            TabView {
                
                NavigationView {
                    ContentView()
                }
                .tabItem {
                    Image(systemName: "sun.haze.fill")
                    Text("Current")
                }

                NavigationView {
                    HistoryView()
                }
                .tabItem {
                    Image(systemName: "clock.fill")
                    Text("History")
                }

            }
            
        }
    }
}
