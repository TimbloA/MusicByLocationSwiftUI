//
//  Artist.swift
//  MusicByLocationSwiftUI
//
//  Created by Timblo, Adi (WING) on 17/03/2024.
//

import Foundation


struct Artist: Codable{
    var name: String
    
    private enum CodingKeys: String, CodingKey {
        case name = "artistName"
    }
}
