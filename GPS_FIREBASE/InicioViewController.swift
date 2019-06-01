//
//  InicioViewController.swift
//  GPS_FIREBASE
//
//  Created by Claudio Salmito on 31/05/19.
//  Copyright © 2019 Claudio Salmito. All rights reserved.
//

import UIKit
import CoreLocation
import Firebase


class InicioViewController: UIViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        

    }
    
   
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations[locations.count - 1]
        
        //let coordenada = "LAT:\(location.coordinate.latitude) LON:\(location.coordinate.longitude)"
        
        let coordenada = ["Latitude" : "\(location.coordinate.latitude)", "Longitude" : location.coordinate.longitude, "Altitude" : location.altitude] as [String : Any]
        
        
        
        
        
        
        
        //print (coordenada)
        
        let locationsDB = Database.database().reference().child("locations")
        locationsDB.childByAutoId().setValue(coordenada) {
            
            (error, reference) in
            
            if error != nil {
                print (error)
            } else {
                print("Registro gravado com sucesso!")
            }
            
        }
        
        
        
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
