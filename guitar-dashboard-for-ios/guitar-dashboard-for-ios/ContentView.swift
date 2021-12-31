//
//  ContentView.swift
//  guitar-dashboard-for-ios
//
//  Created by Guglielmo Frigerio on 22/12/21.
//

import SwiftUI

struct ContentView: View {
    var devicesManager: DevicesManager = DevicesManager()
    
    private func sendFirstProgramScene() {
        
    }
    
    private func sendSecondProgramScene() {
        
    }

    init() {
        // DeviceConfiguration
        guard let asset = NSDataAsset(name: "DeviceConfiguration") else {
            print("NSDataAsset failed")
            return
        }
        
        let data = asset.data
        let configRoot: ConfigRootModel = try! JSONDecoder().decode(ConfigRootModel.self, from: data)
        devicesManager = DevicesManager(libraries: configRoot.libraries)

    }
    
    var body: some View {
        NavigationView() {
            List() {
                NavigationLink(destination: MainView(devicesManager)) {
                    Text("Main View")
                }
                NavigationLink(destination: MidiPortsView()) {
                    Text("List Midi Ports")
                }
            }
            .navigationBarTitle("Libraries")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
