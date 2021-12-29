//
//  SongListView.swift
//  guitar-dashboard-for-ios
//
//  Created by Guglielmo Frigerio on 28/12/21.
//

import SwiftUI

struct SongListView: View {
    var body: some View {
        List() {
            NavigationLink(destination: SongView(title: "First Title")) {
                Text("First Title")
            }
            NavigationLink(destination: SongView(title: "Second Title")) {
                Text("Second Title")
            }
        }
    }
}
