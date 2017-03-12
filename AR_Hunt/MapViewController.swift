//
//  MapViewController.swift
//  AR_Hunt
//
//  Created by Henry Swanson on 3/10/17.
//

import UIKit
import MapKit
import CoreLocation


class MapViewController: UIViewController {
  
  var targets = [ARItem]()
  let locationManager = CLLocationManager()
  
  func setupLocations() {
    
    let firstTarget = ARItem(itemDescription: "wolf", location: CLLocation(latitude: 37.727266, longitude: -122.424436))
    targets.append(firstTarget)
    
    let secondTarget = ARItem(itemDescription: "wolf", location: CLLocation(latitude: 37.727266, longitude: -122.424436))
    targets.append(secondTarget)
    
    let thirdTarget = ARItem(itemDescription: "dragon", location: CLLocation(latitude: 37.727266, longitude: -122.424436))
    targets.append(thirdTarget)
    
    for item in targets {
      let annotation = MapAnnotation(location: item.location.coordinate, item: item)
      self.mapView.addAnnotation(annotation)
    }
    
  }

  @IBOutlet weak var mapView: MKMapView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    mapView.userTrackingMode = MKUserTrackingMode.followWithHeading
    setupLocations()
    
    if CLLocationManager.authorizationStatus() == .notDetermined {
      locationManager.requestWhenInUseAuthorization()
    }
    
  }
}
