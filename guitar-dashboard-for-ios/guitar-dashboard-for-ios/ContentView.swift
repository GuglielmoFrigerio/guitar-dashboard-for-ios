//
//  ContentView.swift
//  guitar-dashboard-for-ios
//
//  Created by Guglielmo Frigerio on 22/12/21.
//

import SwiftUI

struct ContentView: View {
    let midiFactory: MidiFactory?
    var midiOutputPort: MidiOutputPort? = nil
    
    init() {
        midiFactory = try? MidiFactory(clientName: "FractalClient")
        if let uwMidiFactory = midiFactory {
            midiOutputPort = uwMidiFactory.createOutputPort(deviceName: "Axe-Fx III")
            if let uwOutputPort = midiOutputPort {
                try? uwOutputPort.sendProgramChange(channel: 0, program: 20)
            }
        }
    }
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
