//
//  Place.swift
//  iXploreNew
//
//  Created by Salomon serfati on 6/8/16.
//  Copyright © 2016 Salomon Serfati. All rights reserved.
//

import Foundation
import MapKit

class Place:NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D()
    var title: String?
    var logoURL: String?
    var ratable:Bool = true
    var descriptionOfLabel: String?
    let currentDate = NSDate()
    var favorite: Bool = false
    
    
    
    class func placeList() -> [Place] {
        
        let place = Place ()
        
        place.title = "Workshop 17"
        place.logoURL = "https://www.eff.org/files/https-everywhere2.jpg"
        place.coordinate = CLLocationCoordinate2D(latitude: -33.906764,longitude: 18.4164983)
        place.descriptionOfLabel = "The Place that makes you feel like you are working in Google"
        place.currentDate
        place.favorite = true
        
        let place2 = Place ()
        place2.title = "Truth Coffee"
        place2.ratable = false
        place2.logoURL = "https://robohash.org/123.png"
        place2.coordinate = CLLocationCoordinate2D(latitude: -33.9281976,longitude: 18.4227045)
        place2.descriptionOfLabel = "They say this place has got some dopy coffe"
        place2.currentDate
        
        let place3 = Place ()
        place3.title = "Chop Chop Coffee"
        place3.ratable = true
        place3.logoURL = "https://www.eff.org/files/https-everywhere2.jpg"
        place3.coordinate = CLLocationCoordinate2D(latitude: -33.9271879,longitude: 18.4327055)
        place.descriptionOfLabel = "Never heard of this place in my life"
        place3.currentDate
        place3.favorite = true
        
        
        return [place, place2, place3]
    }

}

extension UIImageView   {
    
    
    public func imageFromUrl(urlString: String) {
        if let url = NSURL(string: urlString) {
            let request = NSURLRequest(URL: url)
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {
                (response: NSURLResponse?, data: NSData?, error: NSError?) -> Void in
                if let imageData = data as NSData? {
                    self.image = UIImage(data: imageData)
                }
            }
        }
    }
    
}
