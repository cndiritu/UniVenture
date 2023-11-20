//
//  UniVerseApp.swift
//  UniVerse
//
//  Created by Christian  on 11/12/23.
//

import SwiftUI
import Firebase

@main
struct UniVerseApp: App {
    
    
    init() {
        FirebaseApp.configure()
        print("Configured Firebase!")
    }
    @StateObject private var vm = LocationViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationView()
                .environmentObject(vm)
        }
    }
}
