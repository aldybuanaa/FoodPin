//
//  FoodPinController.swift
//  FoodPin
//
//  Created by aldybuana on 20/10/22.
//

import UIKit

class FoodPinViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var viewModel: FoodPinViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
        setup()
    }
    func setup() {
        viewModel = FoodPinViewModel(delegate: self)
        tableView.dataSource = self
        tableView.delegate = self
    }
}


// MARK: - UITableViewDataSource
extension FoodPinViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCoffeeShop
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodPinCellId", for: indexPath) as! FoodPinViewCell
        
        let foodpin = indexPath.row
        cell.thumbImage.image = viewModel.coffeeshopsThumb(at: foodpin)
        cell.nameLabel.text = viewModel.coffeeshopsName(at: foodpin)
        cell.addressLabel.text = viewModel.coffeeshopsLocation(at: foodpin)
        cell.categoryLabel.text = viewModel.coffeeshopsType(at: foodpin)
        
        return cell
    }
}
    
// MARK: - UITableViewDelegate
extension FoodPinViewController: UITableViewDelegate {

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let viewController = storyboard.instantiateViewController(withIdentifier: "detail") as? FoodPinDetailViewController {

            let foodpin = indexPath.row

            viewController.image = viewModel.coffeeshopsThumb(at: foodpin)
            viewController.name = viewModel.coffeeshopsName(at: foodpin)
            viewController.address = viewModel.coffeeshopsLocation(at: foodpin)
            viewController.type = viewModel.coffeeshopsType(at: foodpin)
            viewController.phone = viewModel.coffeeshopsPhone(at: foodpin)
            viewController.desc = viewModel.coffeeshopsDesc(at: foodpin)
            viewController.latitude = viewModel.coffeeshopsLatitude(at: foodpin)
            viewController.longitude = viewModel.coffeeshopsLongitude(at: foodpin)
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

// MARK: - Helpers
extension FoodPinViewController {
    func addCoffeeshop() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nv = storyboard.instantiateViewController(withIdentifier: "navNewRestaurant") as! UINavigationController
        let vc = nv.viewControllers.first as! NewRestaurantViewController
        
        vc.completion = { (image, name, type, location, phone, desc, latitude, longitude) in
            self.viewModel.addCoffeeshops(name: name, type: type, location: location, phone: phone, description: desc, image: image, latitude: latitude, longitude: longitude)
        }
        
        present(nv, animated: true)
    }
}

// MARK: - Actions
extension FoodPinViewController {
    @IBAction func addButtonTapped(_ sender: Any) {
        addCoffeeshop()
    }
}

// MARK: - RestaurantViewModelDelegate
extension FoodPinViewController: FoodPinViewModelDelegate {
    func foodPinDidUpdate() {
        tableView.reloadData()
    }
}
