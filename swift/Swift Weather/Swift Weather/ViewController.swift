//
//  ViewController.swift
//  Swift Weather
//
//  Created by adminstrator on 16/2/28.
//  Copyright © 2016年 ddd.cc. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON


class ViewController: UIViewController , CLLocationManagerDelegate{

    @IBOutlet weak var city: UILabel!
    
    @IBOutlet weak var tempLabel: UILabel!
    
    @IBOutlet weak var descLabel: UILabel!
    
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let background = UIColor(patternImage: UIImage(named: "123.jpg")!)
        view.backgroundColor = background
        
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        if(ios8()){
            locationManager.requestAlwaysAuthorization()
        }
        locationManager.startUpdatingLocation()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func ios8() -> Bool{
       let version =   Float( UIDevice.currentDevice().systemVersion)
        return version > 8.0
    }
    
    //progma
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       let location =  locations[locations.count - 1 ]
        
        if location.horizontalAccuracy > 0 {
            locationManager.stopUpdatingLocation()
            print(location.coordinate.latitude)
            print(location.coordinate.longitude)
            
            manager.stopUpdatingLocation()
            updateWeather(location.coordinate.latitude, longitude : location.coordinate.longitude)
           
        }
        
    }
    
    func updateWeather(latitude : CLLocationDegrees , longitude : CLLocationDegrees ) {
        
        
        
        let params:[String:AnyObject]? = ["lat": latitude, "lon":longitude,"cnt":"0", "APPID" : "4f4be8fe7031dddd5dec789e01c1b3ac"]
        let url = "http://api.openweathermap.org/data/2.5/weather"
        
        //var manager = AFHTTPSessionManager(url)
        
        Alamofire.request(.GET, url, parameters: params).responseString(completionHandler: {
                response in
                //print(response)
            switch response.result {
            case .Success(let value ):
                print(value )
                self.updateUI(value)
            case .Failure(let error ):
                print(error)
                
            }
            }
        )
    }
    
    func updateUI(jsonStr : String?){
        guard  let _ = jsonStr  where  jsonStr != "" else {
            print("数据无效")
            return
        }
        
        let json = JSON.parse(jsonStr!)
        
        let main = json["weather"][0]["main"].stringValue
        let id = json["weather"][0]["id"].stringValue
        
        var temp = json["main","temp"].double
        
        if json["sys","country"].string == "US" {
            temp = round(((temp! - 273.15) * 1.8 ) + 32)
        } else {
            temp = round(temp! - 273.15)
        }
        
        
        let city =  json["name"].string
        
        self.city.text = city
        self.tempLabel.text = "\(temp!)˚"
        self.descLabel.text = "\(id) \(main)"
        
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print(error)
    }
    
}

