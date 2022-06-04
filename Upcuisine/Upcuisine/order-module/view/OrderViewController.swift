//
//  OrderViewController.swift
//  Upcuisine
//
//  Created by Rumeysa TAN on 4.06.2022.
//

import UIKit
import MapKit
import CoreLocation

class OrderViewController: UIViewController{
    
    @IBOutlet weak var mapSearchBar: UISearchBar!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var address: UILabel!
    
    var cartFoods = [CartFoods]()
    var cartPresenterObject : ViewToPresenterCartProtocol?
    
    var locationManager : CLLocationManager = CLLocationManager()
    let request = MKLocalSearch.Request()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapSearchBar.delegate = self
        mapView.delegate = self
        locationManager.delegate = self
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        let center = CLLocationCoordinate2D(latitude: 36.882759, longitude: 30.769476)
        let span = MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
        let area = MKCoordinateRegion(center: center, span: span)
        mapView.setRegion(area, animated: true)
        
        request.region = mapView.region
    }
    
    @IBAction func orderButtonAction(_ sender: Any) {
        
//        TODO: add update the view, send cartList info to service
//        performSegue(withIdentifier: "orderComplate", sender: nil)
    }
    
}

extension OrderViewController : UISearchBarDelegate, MKMapViewDelegate, CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let lastLocation : CLLocation = locations[locations.count-1]
        
        let center = CLLocationCoordinate2D(latitude: lastLocation.coordinate.latitude, longitude: lastLocation.coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
        let area = MKCoordinateRegion(center: center, span: span)
        mapView.setRegion(area, animated: true)
        mapView.showsUserLocation = true
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
        request.naturalLanguageQuery = mapSearchBar.text
        
        if(mapView.annotations.count > 0) {
            mapView.removeAnnotations(mapView.annotations)
        }
        
        let search = MKLocalSearch(request: request)
        
        search.start(completionHandler: { (response,error) in
            if error != nil {
                print("Map error")
            }else if(response!.mapItems.count == 0){
                print("No such place found")
            }else{
                for place in response!.mapItems {
                    if let name = place.name, let title = place.placemark.title{
                        print(name)
                        print(title)
                        
                        let pin = MKPointAnnotation()
                        pin.coordinate = place.placemark.coordinate
                        pin.title = name
                        pin.subtitle = title
                        self.mapView.addAnnotation(pin)
                    }
                    self.address.text = String(place.name!)
                }
            }
        })
        
    }
}
