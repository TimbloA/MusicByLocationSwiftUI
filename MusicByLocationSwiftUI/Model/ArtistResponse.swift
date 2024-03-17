//
//  ArtistResponse.swift
//  MusicByLocationSwiftUI
//
//  Created by Timblo, Adi (WING) on 17/03/2024.
//

import Foundation

struct ArtistResponse: Codable {
    var count: Int
    var results: [Artist]
    
    private enum CodingKeys: String, CodingKey {
        case count
        case results
    }
}
