//
//  Song.swift
//  guitar-dashboard-for-ios
//
//  Created by Guglielmo Frigerio on 28/12/21.
//

import Foundation

struct Song: Decodable {
    let name: String
    let track: Track
    let patches: [Patch]    
}
