//
//  Patch.swift
//  guitar-dashboard-for-ios
//
//  Created by Guglielmo Frigerio on 28/12/21.
//

import Foundation

struct Patch: Decodable {
    let name: String
    let axeFx2: Program
    let axeFx3: Program
}
