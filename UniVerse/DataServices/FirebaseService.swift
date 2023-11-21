//
//  FirebaseService.swift
//  UniVerse
//
//  Created by Michael Gesse on 11/21/23.
//

import Foundation
import Firebase
import FirebaseFirestore
import CoreLocation

class FirebaseService {
    let db = Firestore.firestore()
    
    func saveLocationData(location: Location, completion: @escaping (Result<Void, Error>) -> Void) {
        let data: [String: Any] = [
            "latitude": location.coordinates.latitude,
            "longitude": location.coordinates.longitude,
            "timestamp": FieldValue.serverTimestamp()
        ]
        
        db.collection("locations").addDocument(data: data) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }
    
    // Additional methods to retrieve data could be implemented here.
}

