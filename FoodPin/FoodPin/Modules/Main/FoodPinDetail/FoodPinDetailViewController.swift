//
//  FoodPinDetailViewController.swift
//  FoodPin
//
//  Created by aldybuana on 21/10/22.
//

import UIKit
import MapKit
import SafariServices

var viewModel: FoodPinViewModel!

class FoodPinDetailViewController: UIViewController {
    @IBOutlet weak var closeButtonTapped: UIButton!
    @IBOutlet weak var thumbImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var rateButton: UIButton!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var ratingImageView: UIImageView!
    
    var image = UIImage()
    var name = ""
    var type = ""
    var address = ""
    var phone = ""
    var desc = ""
    var rate = UIImage()
    var annotation: Any!
    var latitude: Double = 0.0
    var longitude: Double = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    func setup(){
        thumbImage.image = image
        nameLabel.text = name
        categoryLabel.text = type
        addressLabel.text = address
        phoneLabel.text = phone
        descLabel.text = desc
        ratingImageView.image = rate
        
        mapView.isScrollEnabled = false
        mapView.delegate = self

        
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        mapView.addAnnotation(annotation)
        
        let region = mapView.regionThatFits(MKCoordinateRegion(center: coordinate, latitudinalMeters: 200, longitudinalMeters: 200))
        mapView.setRegion(region, animated: true)
    }
    
    func rateRestaurant (){
        presentReviewViewController(backgroundImage: image)
    }
    
    @IBAction func rateItButtonTapped(_ sender: Any) {
        rateRestaurant()
    }
}

// MARK: - MKMapViewDelegate
extension FoodPinDetailViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didSelect annotation: MKAnnotationView) {
        routeToPlace()
    }
    
    func routeToPlace() {
        let actionSheet = UIAlertController(title: "Directions using", message: nil, preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Maps", style: .default, handler: { (_) in
            self.openMaps()
        }))
        
        if canOpen(urlScheme: "comgooglemaps") {
            actionSheet.addAction(UIAlertAction(title: "Google Maps", style: .default, handler: { (_) in
                self.openGoogleMaps()
            }))
        }
        
        if canOpen(urlScheme: "waze") {
            actionSheet.addAction(UIAlertAction(title: "Waze", style: .default, handler: { (_) in
                self.openWaze()
            }))
        }
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        present(actionSheet, animated: true)
    }
    
    func canOpen(urlScheme: String) -> Bool {
        var components = URLComponents()
        components.scheme = urlScheme
        if let url = components.url {
            return UIApplication.shared.canOpenURL(url)
        }
        return false
    }
    
    func openMaps() {
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate))
        mapItem.name = name
        mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving])
    }
    func openGoogleMaps() {
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let latString = String(format: "%.6f", coordinate.latitude)
        let lngString = String(format: "%.6f", coordinate.longitude)
        let url = URL(string: "comgooglemaps://?saddr=&daddr=\(latString),\(lngString)&directionsmode=driving")!
        let application = UIApplication.shared
        if application.canOpenURL(url) {
            application.open(url)
        }
    }
        
    func openWaze() {
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let latString = String(format: "%.6f", coordinate.latitude)
        let lngString = String(format: "%.6f", coordinate.longitude)
        let url = URL(string: "waze://?ll=\(latString),\(lngString)&navigate=yes")!
        let application = UIApplication.shared
        if application.canOpenURL(url) {
            application.open(url)
        }
    }
        
}
