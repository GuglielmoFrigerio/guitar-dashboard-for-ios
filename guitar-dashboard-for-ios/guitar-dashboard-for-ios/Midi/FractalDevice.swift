//
//  FractalDevice.swift
//  guitar-dashboard-for-ios
//
//  Created by Guglielmo Frigerio on 22/12/21.
//

import Foundation
struct FractalDevice {
    let midiOutputPort: MidiOutputPort?
    
    init(midiFactory: MidiFactory, deviceName: String) {
        midiOutputPort = midiFactory.createOutputPort(deviceName: deviceName)
        
    }
    
    func send(programScene: ProgramScene) {
        
    }
}
