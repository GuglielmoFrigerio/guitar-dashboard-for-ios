//
//  DevicesManager.swift
//  guitar-dashboard-for-ios
//
//  Created by Guglielmo Frigerio on 28/12/21.
//

import Foundation

class DevicesManager {
    private let libraries: [LibraryModel]
    let midiFactory: MidiFactory?
    var fractalDevice: FractalDevice? = nil

    init(libraries: [LibraryModel]) {
        self.libraries = libraries
        midiFactory = try? MidiFactory(clientName: "FractalClient")
        if let uwMidiFactory = midiFactory {
            fractalDevice = FractalDevice(midiFactory: uwMidiFactory, deviceName: "Axe-Fx III")
            DIContainer.shared.register(type: MidiFactoryProtocol.self, component: uwMidiFactory)
        }
    }    
}
