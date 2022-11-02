//
//  FoodPinViewModel.swift
//  FoodPin
//
//  Created by aldybuana on 23/10/22.
//

import UIKit

protocol FoodPinViewModelDelegate: NSObjectProtocol {
    func foodPinDidUpdate()
}

class FoodPinViewModel {
    weak var delegate: FoodPinViewModelDelegate?
    init(delegate: FoodPinViewModelDelegate) {
        self.delegate = delegate
        
    }
        
    var coffeeshops: [Coffeeshop] = [
        Coffeeshop(name: "Boja Eatery", type: "Coffeeshop / Cafe", location: "Jl. Sumatera", phone: "123-23456", description: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque.", image: UIImage (named: "bojaeatery")!, latitude: -6.916394133350804, longitude: 107.61340242619107),
            
        Coffeeshop(name: "Brewery Coffee", type: "Tea House", location: "Jl. Panaitan", phone: "321-453461", description: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque.", image: UIImage (named: "brewery")!, latitude: -6.918374229234431, longitude: 107.61727586430283),
            
        Coffeeshop(name: "Casadela Coffee", type: "Cafe Shop", location: "Jl. Sumatera", phone: "789-8795367", description: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque.", image: UIImage (named: "casadela")!, latitude: -6.916394133350804, longitude: 107.61340242619107),
            
        Coffeeshop(name: "Dago Terrace", type: "Home Coffee", location: "Jl. Sudirman", phone: "123-134657", description: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque.", image: UIImage (named: "dagoterrace")!, latitude: -6.890219195021147, longitude: 107.61263812470388),
            
        Coffeeshop(name: "Hola Koffie", type: "Coffeeshop / Cafe", location: "Jl. Braga", phone: "123-4567457", description: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque.", image: UIImage (named: "holakoffie")!, latitude: -6.916682793493255, longitude: 107.60902906888104),
            
        Coffeeshop(name: "Imah Kai", type: "Tea House", location: "Jl. Ir. H. Juanda", phone: "434-456786", description: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque.", image: UIImage (named: "imahkai")!, latitude: -6.8631387430828585, longitude: 107.62503792655166),
            
        Coffeeshop(name: "Jiwan Kopi", type: "Cafe", location: "Jl. Ir. H. Juanda", phone: "565-24572457", description: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque.", image: UIImage (named: "jiwan")!, latitude: -6.90079909278895, longitude: 107.61249876703307),
            
        Coffeeshop(name: "Kilogram Space", type: "Home Coffee", location: "Jl. Karang Tinggal", phone: "676-368345", description: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque.", image: UIImage (named: "kilogram")!, latitude: -6.885480500853848, longitude: 107.59553929771637),
            
        Coffeeshop(name: "Masagi Coffee", type: "Bakery / Cafe", location: "Jl. Gunung Kareumbi", phone: "436-56856", description: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque.", image: UIImage (named: "masagi")!, latitude: -6.8687734950363275, longitude: 107.60649946888076),
            
        Coffeeshop(name: "Nannys Pavillion", type: "Tea House / Cafe", location: "Jl. Rancabentang", phone: "999-123123", description: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque.", image: UIImage (named: "nannys")!, latitude: -6.867545487603274, longitude: 107.61044142655162),
    ]
        
    // MARK: - Helpers
    var numberOfCoffeeShop: Int {
        return coffeeshops.count
    }
    
    func coffeeshopsThumb(at index: Int) -> UIImage {
        return coffeeshops[index].image
    }
    
    func coffeeshopsName(at index: Int) -> String {
        return coffeeshops[index].name
    }
    
    func coffeeshopsLocation(at index: Int) -> String{
        return coffeeshops[index].location
    }
    
    func coffeeshopsPhone(at index: Int) -> String {
        return coffeeshops[index].phone
    }
    
    func coffeeshopsDesc(at index: Int) -> String {
        return coffeeshops[index].description
    }
    
    func coffeeshopsType(at index: Int) -> String {
        return coffeeshops[index].type
    }
    
    func coffeeshopsRating(at index: Int) -> Rating? {
        return coffeeshops[index].rating
    }
    
    func coffeeshopsLatitude(at index: Int) -> Double {
        return coffeeshops[index].latitude
    }
    
    func coffeeshopsLongitude(at index: Int) -> Double {
        return coffeeshops[index].longitude
    }
    
    func addCoffeeshops(name: String, type: String, location: String, phone: String, description: String, image: UIImage, latitude: Double, longitude: Double) {
        let coffeeshop = Coffeeshop(name: name, type: type, location: location, phone: phone, description: description, image: image, latitude: latitude, longitude: longitude)
        coffeeshops.insert(coffeeshop, at: 0)
        delegate?.foodPinDidUpdate()
    }
        
    func rateRestaurant(at index: Int, rating: Rating) {
        coffeeshops[index].rating = rating
        delegate?.foodPinDidUpdate()
    }
}

