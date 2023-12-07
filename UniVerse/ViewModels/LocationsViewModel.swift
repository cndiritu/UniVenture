//
//  LocationsViewModel.swift
//  UniVerse
//
//  Created by Christian  on 11/15/23.
//

import Foundation
import MapKit
import SwiftUI

class LocationViewModel: ObservableObject{
    @Published var locations: [Location]
    
    @Published var mapLocation: Location{
        didSet{
            updateMapRegion(location: mapLocation)
        }
    }
    //Current Region on Map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion ()
    let mapSpan = MKCoordinateSpan (latitudeDelta: 0.1, longitudeDelta: 0.1)
     
    //Show List of Locations
    @Published var showLocationsList: Bool = false
    
    // Show location detail via sheet
    @Published var sheetLocation: Location? = nil
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Location){
        withAnimation(.easeInOut){
            mapRegion = MKCoordinateRegion (
                center: location.coordinates,
            span: mapSpan)
        }
   
        
    }
    func toggleLocationsList() {
        
        withAnimation(.easeInOut){
            showLocationsList.toggle()
        }
    }
    
    func showNextLocation(location: Location){
        withAnimation(.easeInOut){
            mapLocation = location
            showLocationsList = false
            
        }
    }
    
    func nextButtonPressed(){
        //find the current index
        guard let currentIndex = locations.firstIndex(where: {$0 == mapLocation}) else {
            print("Could not find currentindex in locations array!!! Shouldn't happen")
            return
        }
        //these lines do the same thing
        //let currentIndex = locations.firstIndex(where: {$0 == mapLocation})
        //currentIndex = locations.firstIndex{ location in
        //return location == mapLocation
        
        //check if the currentIndex is valid
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            
            //next index is not valid so we restart from 0
            guard let firstLocation = locations.first else {return}
            showNextLocation(location: firstLocation)
            return
        }
        //Next index is valid
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
    
    }
}
