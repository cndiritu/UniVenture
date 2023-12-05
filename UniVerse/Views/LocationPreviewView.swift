//
//  LocationPreviewView.swift
//  UniVerse
//
//  Created by skiduser on 12/5/23.
//

import SwiftUI



struct LocationPreviewView: View {
    
    let location: Location
    
    var body: some View {
        HStack {
            VStack(spacing: 16.0) {
                imageSection
                titleSection
            }
            VStack(spacing: 8){
                learnMoreButton
                nextButton
            }
        }
    }
}

#Preview {
    ZStack {
        Color.green.ignoresSafeArea()
        
        LocationPreviewView(location: LocationsDataService.locations.first!)
    }
    //avoid explicit unwrapping when you can
    
}


extension LocationPreviewView{
    
    private var imageSection: some View{
        ZStack{
            if let imageName = location.imageNames.first{
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                    .cornerRadius(10)
            }
        }
        
        .padding(6)
        .background(Color.white)
        .cornerRadius(10)
    }
    
    private var titleSection: some View{
        VStack(alignment: .leading) {
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
            
            Text(location.cityName)
                .font(.subheadline)
        }
    }
    
    private var learnMoreButton: some View{
        Button{
            
        } label: {
            Text("Learn More")
                .font(.headline)
                .frame(width: 125, height: 35)
        }
        .buttonStyle(.borderedProminent)
    }
    private var nextButton: some View{
        Button{
            
        } label: {
            Text("Next")
                .font(.headline)
                .frame(width: 125, height: 35)
        }
        .buttonStyle(.bordered)
    }
    
}
