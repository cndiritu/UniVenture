//
//  LocationView.swift
//  UniVerse
//
//  Created by Christian  on 11/15/23.
//

import SwiftUI
import MapKit



struct LocationView: View {
    

    @EnvironmentObject private var vm: LocationViewModel
    
    var body: some View {
        ZStack{
            Map(coordinateRegion: $vm.mapRegion)
                .ignoresSafeArea()
        }
    }
}
 
#Preview {
    LocationView()
        .environmentObject(LocationViewModel())
}
