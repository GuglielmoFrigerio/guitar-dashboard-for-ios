//
//  Song.swift
//  guitar-dashboard-for-ios
//
//  Created by Guglielmo Frigerio on 30/12/21.
//

import Foundation

struct Song {
    private let deviceManager: DeviceManagerProtocol
    
    init (songModel: SongModel, deviceManager: DeviceManagerProtocol) {
        self.deviceManager = deviceManager
        
        for patchModel in songModel.patches {
            
        }        
    }
}
