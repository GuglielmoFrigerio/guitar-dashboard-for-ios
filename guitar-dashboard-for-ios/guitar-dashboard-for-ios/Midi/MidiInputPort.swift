//
//  MidiInputPort.swift
//  guitar-dashboard-for-ios
//
//  Created by Guglielmo Frigerio on 05/01/22.
//

import Foundation
import CoreMIDI

class MidiInputPort {
    var inputPort: MIDIPortRef = 0
    var source: MIDIEndpointRef = 0
    
    init (midiClientRef: MIDIClientRef, portName: String, sourceIndex: Int) throws {
        var status = MIDIInputPortCreateWithProtocol(midiClientRef, portName as CFString, MIDIProtocolID._1_0, &inputPort) {
            [weak self] eventList, srcConnRefCon in
        }
        
        if (status != noErr) {
            throw MidiError.MidiOperationFailed(errorCode: status, functionName: "MIDIInputPortCreateWithProtocol")
        }

        source = MIDIGetSource(sourceIndex)
        status = MIDIPortConnectSource(inputPort, source, &source)
        if (status != noErr) {
            throw MidiError.MidiOperationFailed(errorCode: status, functionName: "MIDIPortConnectSource")
        }

    }
}
