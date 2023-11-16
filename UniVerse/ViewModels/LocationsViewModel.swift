//
//  LocationsViewModel.swift
//  UniVerse
//
//  Created by Christian  on 11/15/23.
//

import Foundation


class LocationViewModel: ObservableObject{
    @Published var locations: [Location]
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
    }
}
