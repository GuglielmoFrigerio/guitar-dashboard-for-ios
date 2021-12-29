//
//  MidiPortsView.swift
//  guitar-dashboard-for-ios
//
//  Created by Guglielmo Frigerio on 29/12/21.
//

import SwiftUI

struct MidiPortsView: View {
    var midiFactory: MidiFactoring?
    var midiSourceNames: [String] = []
    
    init() {
        self.midiFactory = DIContainer.shared.resolve(type: MidiFactoring.self)
        if let msn = midiFactory?.getMidiSources() {
            self.midiSourceNames = msn
        }
    }
    
    
    var body: some View {
        ForEach(midiSourceNames, id: \.self) { name in
            Text(name)
        }
    }    
}
