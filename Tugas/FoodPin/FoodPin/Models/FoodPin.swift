//
//  FoodPin.swift
//  FoodPin
//
//  Created by aldybuana on 21/10/22.
//

import Foundation
import MapKit

class Coffeeshop {
    var name: String
    var type: String
    var location: String
    var image: UIImage
    var phone: String
    var description: String
    var rating:  Rating?
    var latitude: Double
    var longitude: Double
    
    init(name: String, type: String, location: String, phone: String, description: String, image: UIImage, rating: Rating? = nil, latitude: Double, longitude: Double) {
        self.name = name
        self.type = type
        self.location = location
        self.phone = phone
        self.description = description
        self.image = image
        self.rating =  rating
        self.latitude = latitude
        self.longitude = longitude
    }
}

//// MARK: - MKAnnotation
//extension Coffeeshop: MKAnnotation {
//    var coordinate: CLLocationCoordinate2D {
//        return CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!)
//    }
//
//    var title: String? {
//        return name
//    }
//
//    var subtitle: String? {
//        return location
//    }
//}
