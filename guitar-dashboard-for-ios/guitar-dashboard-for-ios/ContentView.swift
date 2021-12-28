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
    var fractalDevice: FractalDevice? = nil
    
    private func sendFirstProgramScene() {
        
        let programScene = ProgramScene(programNumber: 23, sceneNumber: 4)
        try! fractalDevice?.send(programScene: programScene)
    }
    
    private func sendSecondProgramScene() {
        
        let programScene = ProgramScene(programNumber: 411, sceneNumber: 7)
        try! fractalDevice?.send(programScene: programScene)
    }

    init() {
        midiFactory = try? MidiFactory(clientName: "FractalClient")
        if let uwMidiFactory = midiFactory {
            fractalDevice = FractalDevice(midiFactory: uwMidiFactory, deviceName: "Axe-Fx III")
        }
    }
    
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
            Button(action: sendFirstProgramScene) {
                Text("Send 23.4")
            }.padding()
            Button(action: sendSecondProgramScene) {
                Text("Send 411.7")
            }.padding()

        }
    }    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
