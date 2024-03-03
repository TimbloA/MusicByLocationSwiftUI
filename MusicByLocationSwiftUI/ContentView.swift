//
//  ContentView.swift
//  MusicByLocationSwiftUI
//
//  Created by Timblo, Adi (WING) on 03/03/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var locationHandler = LocationHandling()
    
    var body: some View {
        VStack {
            Text(locationHandler.lastKnownLocation)
                .padding()
            Spacer()
            Button("Find Music", action: {
                locationHandler.requestLocation()
            })
        }.onAppear(perform: {
            locationHandler.requestAuthorisation()
        })
    }
    
}

#Preview {
    ContentView()
}
