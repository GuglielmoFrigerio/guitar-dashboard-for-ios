//
//  Track.swift
//  guitar-dashboard-for-ios
//
//  Created by Guglielmo Frigerio on 28/12/21.
//

import Foundation

struct Track: Decodable {
    let name: String
    let markers: [Marker]
}
