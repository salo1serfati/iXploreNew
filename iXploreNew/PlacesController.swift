//
//  UserController.swift
//  iXploreNew
//
//  Created by Salomon serfati on 6/14/16.
//  Copyright © 2016 Salomon Serfati. All rights reserved.
//

import Foundation
import MapKit


class PlacesController: NSObject, MKAnnotation  {
    
    var placeList: [Place] = []

    
    // Singleton design pattern
    class var sharedInstance: PlacesController {
        struct Static {
            static var instance:PlacesController?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token)    {
            Static.instance = PlacesController()
        }
        return Static.instance!
    }
    
    func addPlace(title:String, coordinate: CLLocationCoordinate2D, logoUrl:String, descriptionOfLabel: String, favorite: Bool) {
    
        var newPlace = Place(title: title, coordinate: coordinate, logoUrl: logoUrl, descriptionOfLabel: descriptionOfLabel, favorite: favorite)
        placeList.append(newPlace)
    }

    
    
    
}