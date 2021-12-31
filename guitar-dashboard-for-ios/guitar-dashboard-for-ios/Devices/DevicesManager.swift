//
//  DevicesManager.swift
//  guitar-dashboard-for-ios
//
//  Created by Guglielmo Frigerio on 28/12/21.
//

import Foundation

class DevicesManager: DeviceManagerProtocol {
    private let libraryModels: [LibraryModel]
    var libraries: [Library] = []
    let midiFactory: MidiFactory?
    var fractalDevice: FractalDevice? = nil
    
    init() {
        midiFactory = nil
        libraryModels = []
    }

    init(libraries: [LibraryModel]) {
        self.libraryModels = libraries        
        
        midiFactory = try? MidiFactory(clientName: "FractalClient")
        if let uwMidiFactory = midiFactory {
            fractalDevice = FractalDevice(midiFactory: uwMidiFactory, deviceName: "Axe-Fx III")
            DIContainer.shared.register(type: MidiFactoryProtocol.self, component: uwMidiFactory)
        }
        
        for libMode in libraryModels {
            self.libraries.append(Library(libMode, self))
        }
    }
}
