//
//  MidiOutputPort.swift
//  Lendmarks
//
//  Created by Guglielmo Frigerio on 22/12/21.
//

import Foundation
import CoreMIDI

struct MidiOutputPort {
    var midiPortRef = MIDIPortRef()
    let midiEndpointRef: MIDIEndpointRef
    
    init (midiClientRef: MIDIClientRef, portName: String, sourceIndex: Int) throws {
        let status = MIDIOutputPortCreate(midiClientRef, portName as CFString, &midiPortRef)
        
        if (status != noErr) {
            throw MidiError.MidiOperationFailed(errorCode: status, functionName: "MIDIOutputPortCreate")
        }
        
        midiEndpointRef = MIDIGetDestination(sourceIndex)        
    }
    
    func sendProgramChange(channel: UInt8, program: UInt8) throws {
        
        var packet: MIDIPacket = MIDIPacket();
        packet.timeStamp = 0;
        packet.length = 3;
        packet.data.0 = 0xC0 + channel; // Note On event channel 1
        packet.data.1 = program; // Note C3
        packet.data.2 = 0; // Velocity

        var packetList:MIDIPacketList = MIDIPacketList(numPackets: 1, packet: packet);
        let status = MIDISend(midiPortRef, midiEndpointRef, &packetList)
        if status != noErr {
            throw MidiError.MidiOperationFailed(errorCode: status, functionName: "MIDISend")
        }
    }
    
    func sendControlChange(channel: UInt8, index: UInt8, value: UInt8) {
        
    }
}
