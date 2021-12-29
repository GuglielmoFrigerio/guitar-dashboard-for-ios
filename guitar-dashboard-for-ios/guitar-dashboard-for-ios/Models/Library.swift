//
//  Library.swift
//  guitar-dashboard-for-ios
//
//  Created by Guglielmo Frigerio on 28/12/21.
//

import Foundation

struct Library: Decodable {
    let name: String
    let songs: [Song]
}
