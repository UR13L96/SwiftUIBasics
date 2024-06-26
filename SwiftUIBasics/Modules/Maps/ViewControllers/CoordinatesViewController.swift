//
//  CoordinatesViewController.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 29/04/24.
//

import UIKit
import CoreLocation

class CoordinatesViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var coordinatesLabel: UILabel!
    @IBOutlet weak var countryTextField: UITextField!
    
    var manager = CLLocationManager()
    var latitude: CLLocationDegrees?
    var longitude: CLLocationDegrees?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        manager.delegate = self
        manager.requestAlwaysAuthorization()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
    }

    @IBAction func onGetCoordinatesClicked(_ sender: Any) {
        if let latitude = latitude, let longitude = longitude {
            self.coordinatesLabel.text = "(\(latitude), \(longitude))"
            
            UserDefaults.standard.set(latitude, forKey: "latitude")
            UserDefaults.standard.set(longitude, forKey: "longitude")
            UserDefaults.standard.set(countryTextField.text, forKey: "country")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            latitude = location.coordinate.latitude
            longitude = location.coordinate.longitude
        }
    }
}
