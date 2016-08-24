//
//  MapViewController.swift
//  SwiftTest
//
//  Created by 吴小星 on 16/8/23.
//  Copyright © 2016年 crash. All rights reserved.
//

import UIKit
import ArcGIS
import SGTileLayer
import SGLocationUtil

class MapViewController: UIViewController {
    
    var mapView :AGSMapView!
    var locationBtn :UIButton!
    
    init(){
        super.init(nibName: nil, bundle: nil)
        self.mapView = AGSMapView(frame: self.view.frame)
        self.view.addSubview(self.mapView)
        self.mapView.autoresizingMask = [.FlexibleHeight,.FlexibleWidth]
        self.mapView.translatesAutoresizingMaskIntoConstraints = false
        
        locationBtn = UIButton(type: .Custom)
        self.view.insertSubview(locationBtn, aboveSubview: self.mapView)
        locationBtn.frame = CGRectMake(0, self.view.frame.size.height - 100, 50, 50)
        locationBtn.backgroundColor = UIColor.redColor()
        locationBtn.addTarget(self, action: #selector(MapViewController.location(_:)), forControlEvents: .TouchUpInside)
        


    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        SGTileLayerUtil.sharedInstance().loadTdtTileLayer(WMTS_VECTOR_2000, andMapView: self.mapView)
        
    }
    
    @objc private func location(button:UIButton){
        
        SGLocationUtil.sharedInstance.getUserLocation(self.mapView, symbolImage: "终点")        
    }
    
}
