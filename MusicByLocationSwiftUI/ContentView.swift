//
//  ContentView.swift
//  MusicByLocationSwiftUI
//
//  Created by Timblo, Adi (WING) on 03/03/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var state = StateController()
    
    var body: some View {
        VStack {
            Text(state.artistNames)
            Text(state.lastKnownLocation)
                .padding()
            Spacer()
            Button("Find Music", action: {
                state.findMusic()
            })
        }.onAppear(perform: {
            state.requestAccessToLocationData()
            state.getArtists()
        })
    }
    
}

#Preview {
    ContentView()
}
