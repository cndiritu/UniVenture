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
           
           mapLayer
                .ignoresSafeArea()
            
            VStack(spacing: 0){
                header
                .padding()
                
                Spacer()
                
                locationsPreviewStack
                
            }
        }
        .sheet(item: $vm.sheetLocation, onDismiss: nil) { location in
            LocationDetailView(location: location)
        }
    }
}
 
#Preview {
    LocationView()
        .environmentObject(LocationViewModel())
}

extension LocationView{
    private var header: some View{
        VStack {
            Button(action: vm.toggleLocationsList) {
                
                Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .frame(height: 55)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .animation(.none, value: vm.mapLocation)
                    //.background(Color.red)
                    .overlay(alignment: .leading){
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: vm.showLocationsList ? 180 : 0))
                    }
            }
            if vm.showLocationsList{
                LocationListView()
            }
            
            //LocationListView()
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
    
    private var mapLayer: some View {
        Map(coordinateRegion: $vm.mapRegion, annotationItems: vm.locations, annotationContent: {location in MapAnnotation(coordinate: location.coordinates){
            LocationMapAnnotationView()
                .scaleEffect(vm.mapLocation == location ? 1 : 0.7)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .onTapGesture {
                    vm.showNextLocation(location: location)
                }
        }})
    }
    
    private var locationsPreviewStack: some View{
        ZStack{
            ForEach(vm.locations){ location in
                if vm.mapLocation == location{
                    LocationPreviewView(location: location)
                            .shadow(color: Color.black.opacity(0.3), radius: 20)
                            .padding()
                            .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                                    
                }
                
            }
        }
        
    }
}
