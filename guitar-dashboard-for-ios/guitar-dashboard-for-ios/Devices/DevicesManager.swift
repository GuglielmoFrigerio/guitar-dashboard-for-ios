//
//  DevicesManager.swift
//  guitar-dashboard-for-ios
//
//  Created by Guglielmo Frigerio on 28/12/21.
//

import Foundation

class DevicesManager {
    let libraries: [Library]
    let midiFactory: MidiFactory?
    var fractalDevice: FractalDevice? = nil

    init(libraries: [Library]) {
        self.libraries = libraries
        midiFactory = try? MidiFactory(clientName: "FractalClient")
        if let uwMidiFactory = midiFactory {
            fractalDevice = FractalDevice(midiFactory: uwMidiFactory, deviceName: "Axe-Fx III")
            DIContainer.shared.register(type: MidiFactoring.self, component: uwMidiFactory)
        }
    }
}
