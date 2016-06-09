//
//  MapViewController.swift
//  iXploreNew
//
//  Created by Salomon serfati on 6/8/16.
//  Copyright © 2016 Salomon Serfati. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tableView: UITableView!
    var spotList: [Place] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        spotList = Place.placeList()
        tableView.delegate = self
        tableView.dataSource = self
        setupMap()
        
        tableView.registerNib(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        
    }
    override func viewWillAppear(animated: Bool) {
        navigationController?.navigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupMap() {
        self.mapView.mapType = .Hybrid
        self.mapView.showsBuildings = true
        for spot in spotList {
            self.mapView.addAnnotation(spot)
        }
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return spotList.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //Set the title of the cell
        let cellIdentifier = "TableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! TableViewCell
        let spot = spotList[indexPath.row]
        cell.labelTableCell.text = spot.title
        
//        cell.imageTableCell.image = UIImageView.imageFromUrl(spot.logoURL)
        return cell
    }
    
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // get the particular pin that was tapped
        let pinToZoomOn = spotList[indexPath.row]
        
        // optionally you can set your own boundaries of the zoom
        let span = MKCoordinateSpanMake(0.02, 0.02)
        
        // or use the current map zoom and just center the map
        // let span = mapView.region.span
        
        // now move the map
        let region = MKCoordinateRegion(center: pinToZoomOn.coordinate, span: span)
        mapView.setRegion(region, animated: true)
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
