//
//  SGLocationUtil.swift
//  Pods
//
//  Created by 吴小星 on 16/8/23.
//
//

import UIKit
import ArcGIS

/**
 *  @author crash         crash_wu@163.com   , 16-08-23 17:08:55
 *
 *  @brief  定位功能
 */
public class SGLocationUtil: NSObject ,CLLocationManagerDelegate{

   lazy var currentLocationPoint  = AGSPoint()//当前定位坐标
   lazy var currentMapView  = AGSMapView() //当前地图
        var location : CLLocationManager!
   lazy var symbolImage = String()
   lazy var locationLayer = AGSGraphicsLayer()
    
    //=======================================//
    //          MARK: 单例模式                 //
    //=======================================//
    public static let sharedInstance = SGLocationUtil()
    
    /// 当前用户定位图层名称
    let userLocationLayer = "userLocationLayer"
    
    //.=======================================//
    //          MARK: 定位功能                 //
    //=======================================//
    private override init() {
        self.location = CLLocationManager()
    }
    
    /**
     获取用户当前位置信息,并且展示到地图上
     
     :param: mapView     当前地图
     
     :param: symbolImage 显示图标名称
     */
   public func getUserLocation (mapView:AGSMapView,symbolImage:String){
    
        self.currentMapView = mapView
        self.symbolImage = symbolImage
    
        if CLLocationManager.locationServicesEnabled() {
            
            self.location.delegate = self
            self.location.desiredAccuracy = kCLLocationAccuracyBest
            self.location.distanceFilter = 1000.0
            self.location.requestAlwaysAuthorization()
            self.location.startUpdatingLocation()
        }
        
    }
    
    public func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        
        switch status {
        case .AuthorizedAlways:
            
            if location.respondsToSelector(#selector(CLLocationManager.requestAlwaysAuthorization)) {
                
                location.requestAlwaysAuthorization()
            }
            
            break
            
        default:
            break
        }
        
    }
    
    
    public func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
        showCurrentLocation(currentMapView , location: locations.last!)
    }
    
    func showCurrentLocation(mapView: AGSMapView , location: CLLocation){
        
        mapView.removeMapLayerWithName(userLocationLayer)
        self.currentLocationPoint = AGSPoint(x: location.coordinate.longitude, y: location.coordinate.latitude, spatialReference: AGSSpatialReference(WKID: 4326))
        
        if mapView.spatialReference.isAnyWebMercator(){
            
            //墨卡托转经纬度坐标
            let mercator = webpointToWS84point(self.currentLocationPoint)

               locationLayer = insertImageLocation(mercator, symbolImage: self.symbolImage)
                mapView.zoomToScale(36111.98186701241, withCenterPoint: mercator, animated: true)
            
        }else{
            
            locationLayer = insertImageLocation(currentLocationPoint, symbolImage: self.symbolImage)
            
            mapView.zoomToScale(36111.98186701241, withCenterPoint: currentLocationPoint, animated: true)
        }
        
        mapView.addMapLayer(locationLayer, withName: userLocationLayer)

    }
    
    
    /**
     给坐标点添加显示图形
     
     :param: point     坐标点
     :param: imageName 图形名称
     
     :returns:
     */
    func insertImageLocation(point : AGSPoint,symbolImage imageName :String)->AGSGraphicsLayer{
        
        let symbolLayer = AGSGraphicsLayer()
        
        let graphicSymbol = AGSPictureMarkerSymbol(imageNamed: imageName)
        
        var attributes : [String :AnyObject] = [:]
        attributes["type"] = "user_Location_Layer"
        
        let graphic = AGSGraphic(geometry: point, symbol: graphicSymbol, attributes: attributes)
        
        symbolLayer.addGraphic(graphic)
        
        symbolLayer.refresh()
        
        return symbolLayer
        
    }
    
    
    /**
     web墨卡托坐标转国标2000
     
     :param: point web墨卡托坐标
     
     :returns: 国标2000坐标
     */
    func webpointToWS84point(point:AGSPoint) ->AGSPoint{
        
        let src = AGSSpatialReference(WKID: 4490)
        let geoEng = AGSGeometryEngine.defaultGeometryEngine()
        
        let ws84point = geoEng.projectGeometry(point, toSpatialReference: src) as! AGSPoint
        
        return ws84point
        
    }

    
}
