//
//  MidiFactory.swift
//  guitar-dashboard-for-ios
//
//  Created by Guglielmo Frigerio on 22/12/21.
//

import Foundation
import CoreMIDI

struct MidiFactory: MidiFactoryProtocol {
    var midiClientRef: MIDIClientRef
    
    private func getSourceIndex(deviceName: String) -> Int {
        let numberOfSources = MIDIGetNumberOfSources()
        
        for idx in 0...numberOfSources {
            let midiEndpointRef = MIDIGetSource(idx)
            var property : Unmanaged<CFString>?
            let err = MIDIObjectGetStringProperty(midiEndpointRef, kMIDIPropertyDisplayName, &property)
            if err == noErr {
                let displayName = property!.takeRetainedValue() as String
                if displayName == deviceName {
                    return idx
                }
            }
        }
        return -1;
    }
    
    init(clientName: String) throws {
        midiClientRef = MIDIClientRef()
        let status = MIDIClientCreateWithBlock(clientName as CFString, &midiClientRef) {
            midiNotification in
        }
        
        if (status != noErr) {
            throw MidiError.MidiOperationFailed(errorCode: status, functionName: "MIDIClientCreateWithBlock")
        }

    }
    
    func createOutputPort(deviceName: String) -> MidiOutputPort? {
        let sourceIndex = getSourceIndex(deviceName: deviceName)
        if sourceIndex != -1 {
            return try? MidiOutputPort(midiClientRef: midiClientRef, portName: deviceName, sourceIndex: sourceIndex)
        }
        return nil
    }
    
    func getMidiSources() -> [String] {
        
        var midiSources = [String]()
        
        let numberOfSources = MIDIGetNumberOfSources()
        
        for idx in 0...numberOfSources {
            let midiEndpointRef = MIDIGetSource(idx)
            var displayName : Unmanaged<CFString>?
            let err = MIDIObjectGetStringProperty(midiEndpointRef, kMIDIPropertyDisplayName, &displayName)
            if (err == noErr) {
                midiSources.append(displayName!.takeRetainedValue() as String)
            }
        }
        
        return midiSources

    }
}
