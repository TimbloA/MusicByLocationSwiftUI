//
//  StateController.swift
//  MusicByLocationSwiftUI
//
//  Created by Timblo, Adi (WING) on 17/03/2024.
//

import Foundation

class StateController: ObservableObject {
    @Published var lastKnownLocation: String = ""
    @Published var artistNames: String = ""
    let locationHandling: LocationHandling = LocationHandling()
    
    func findMusic() {
        locationHandling.requestLocation()
    }
    
    func requestAccessToLocationData() {
        locationHandling.stateController = self
        locationHandling.requestAuthorisation()
    }
    
    func getArtists() {
        guard let url = URL(string:"https://itunes.apple.com/search?term=Lionel%20Richie&entity=musicArtist")
        else{
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with:request) { (data, respose, error) in
            if let data = data {
                if let response = self.parseJson(json: data) {
                    let names = response.results.map {
                        return $0.name
                    }
                    DispatchQueue.main.async {
                        self.artistNames = names.joined(separator: ", ")
                    }
                }
            }
        }.resume()
    }
    
    func parseJson(json: Data) -> ArtistResponse? {
        let decoder = JSONDecoder()
        
        if let artistResponse = try? decoder.decode(ArtistResponse.self, from: json){
            return artistResponse
        }else{
            print("Error decoding JSON")
            return nil
        }
    }
}
