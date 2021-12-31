//
//  SongView.swift
//  guitar-dashboard-for-ios
//
//  Created by Guglielmo Frigerio on 28/12/21.
//

import SwiftUI

struct SongView: View {
    let song: Song
    
    init(_ song: Song) {
        self.song = song
    }
    
    var body: some View {
        List {
            ForEach(song.patches, id: \.self) { patch in
                Text(patch.name)
            }
        }
    }
    
}
