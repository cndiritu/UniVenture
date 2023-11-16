//
//  UniVerseApp.swift
//  UniVerse
//
//  Created by Christian  on 11/12/23.
//

import SwiftUI

@main
struct UniVerseApp: App {
    
    @StateObject private var vm = LocationViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationView()
                .environmentObject(vm)
        }
    }
}
