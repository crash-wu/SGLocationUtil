# SGLocationUtil

[![CI Status](http://img.shields.io/travis/吴小星/SGLocationUtil.svg?style=flat)](https://travis-ci.org/吴小星/SGLocationUtil)
[![Version](https://img.shields.io/cocoapods/v/SGLocationUtil.svg?style=flat)](http://cocoapods.org/pods/SGLocationUtil)
[![License](https://img.shields.io/cocoapods/l/SGLocationUtil.svg?style=flat)](http://cocoapods.org/pods/SGLocationUtil)
[![Platform](https://img.shields.io/cocoapods/p/SGLocationUtil.svg?style=flat)](http://cocoapods.org/pods/SGLocationUtil)

## Describe
基于ArcGis加载天地图瓦片的定位功能

## Usage
    //=======================================//
    //          MARK: 单例模式                 //
    //=======================================//
    public static let sharedInstance = SGLocationUtil()

    /**
    获取用户当前位置信息,并且展示到地图上

    :param: mapView     当前地图

    :param: symbolImage 显示图标名称
    */
    public func getUserLocation (mapView:AGSMapView,symbolImage:String)

    /**
    获取当前用户用户位置坐标

    :returns: 用户位置坐标
    */
    public func getUserPoint()->AGSPoint

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
    ArcGIS-Runtime-SDK-iOS for version 10.2.5

## Installation

SGLocationUtil is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "SGLocationUtil"
```

## Author

吴小星, crash_wu@163.com

## License

SGLocationUtil is available under the MIT license. See the LICENSE file for more info.
