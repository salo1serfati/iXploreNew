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
    var logoUrl: String? //dont persist return nil
    //var ratable:Bool = true
    var descriptionOfLabel: String?
    var currentDate = NSDate()
    var favorite: Bool = false //dont persist return nil
    
    //Creating the Object for the Places
    init (title:String, coordinate: CLLocationCoordinate2D, logoUrl:String, descriptionOfLabel: String, favorite: Bool) {
        self.title = title
        self.coordinate = coordinate
        self.logoUrl = logoUrl
        self.descriptionOfLabel = descriptionOfLabel
        self.favorite = favorite
    }
    
    // MARK: - NSCoding
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.title, forKey: "title")
//        aCoder.encodeObject(self.coordinate, forKey: "coordinate")
        aCoder.encodeObject(self.descriptionOfLabel, forKey: "descriptionOfLabel")
//        aCoder.encodeObject(self.currentDate, forKey: "currentDate")
        
        
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        let title = aDecoder.decodeObjectForKey("title") as? String
        let coordinate = aDecoder.decodeObjectForKey("coordinate") as? CLLocationCoordinate2D
        let descriptionOfLabel = aDecoder.decodeObjectForKey("descriptionOfLabel") as? String
//        let currentDate = aDecoder.decodeObjectForKey("currentDate") as? NSDate
        
        
        self.init(title: title!, coordinate: coordinate!,logoUrl:"", descriptionOfLabel: descriptionOfLabel!,favorite: false)
        
        
    }
    
    class PersistenceManager {
        
        //Gets you the writing document directory path
        class private func documentsDirectory() -> NSString {
            let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
            let documentDirectory = paths[0] as String
            return documentDirectory
        }
        
        class func loadObject(filename:String) -> NSObject? {
            let file = documentsDirectory().stringByAppendingPathComponent(filename)
            let result = NSKeyedUnarchiver.unarchiveObjectWithFile(file)
            return result as? NSObject
        }
        
        class func saveObject(objectToSave: NSObject, fileName: String) {
            let file = documentsDirectory().stringByAppendingPathComponent(fileName)
            NSKeyedArchiver.archiveRootObject(objectToSave, toFile: file)
        }
        
        class func saveNSArray(arrayToSave: NSArray, fileName:String) {
            let file = documentsDirectory().stringByAppendingPathComponent(fileName)
            NSKeyedArchiver.archiveRootObject(arrayToSave, toFile: file)
        }
        
        class func loadNSArray(fileName:String) -> NSArray? {
            let file = documentsDirectory().stringByAppendingPathComponent(fileName)
            let result = NSKeyedUnarchiver.unarchiveObjectWithFile(file)
            return result as? NSArray
        }
    }
    
    class func placeList() -> [Place] {
        
        let place = Place(title:"WorkShop 17", coordinate: CLLocationCoordinate2D(latitude: -33.906764,longitude: 18.4164983), logoUrl:"https://www.eff.org/files/https-everywhere2.jpg", descriptionOfLabel: "Makes you feel like you are working in Google", favorite: true)
        
//        place.title = "Workshop 17"
//        place.logoURL = "https://www.eff.org/files/https-everywhere2.jpg"
//        place.coordinate = CLLocationCoordinate2D(latitude: -33.906764,longitude: 18.4164983)
//        place.descriptionOfLabel = "Makes you feel like you are working in Google"
//        place.currentDate
//        place.favorite = true
        
        let place2 = Place (title:"Truth Coffee", coordinate: CLLocationCoordinate2D(latitude: -33.9281976,longitude: 18.4227045), logoUrl:"https://robohash.org/123.png", descriptionOfLabel: "Some dope coffee", favorite: false)
//        place2.title = "Truth Coffee"
//        place2.logoURL = "https://robohash.org/123.png"
//        place2.coordinate = CLLocationCoordinate2D(latitude: -33.9281976,longitude: 18.4227045)
//        place2.descriptionOfLabel = "Some dope coffee"
//        place2.currentDate
        
        let place3 = Place (title:"Chop Chop Coffee", coordinate: CLLocationCoordinate2D(latitude: -33.9271879,longitude: 18.4327055), logoUrl:"https://www.eff.org/files/https-everywhere2.jpg", descriptionOfLabel: "Never heard of this place in my life", favorite: true)
//        place3.title = "Chop Chop Coffee"
//        place3.logoURL = "https://www.eff.org/files/https-everywhere2.jpg"
//        place3.coordinate = CLLocationCoordinate2D(latitude: -33.9271879,longitude: 18.4327055)
//        place3.descriptionOfLabel = "Never heard of this place in my life"
//        place3.currentDate
//        place3.favorite = true
        
        
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
