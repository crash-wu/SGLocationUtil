//
//  SGTileLayerUtil.h
//  Pods
//
//  Created by 吴小星 on 16/8/23.
//
//

#import <Foundation/Foundation.h>
#import <ArcGIS/ArcGIS.h>
#import "SouthgisTdtType.h"
#import "SouthgisTdt_TileLayer.h"
#import "SouthgisBdWMTSLayer.h"

@interface SGTileLayerUtil : NSObject

/**
 *  @author crash         crash_wu@163.com   , 16-08-23 10:08:01
 *
 *  @brief  单列
 *
 *  @return 类的对象
 */
+(nonnull instancetype)sharedInstance;

/**
 *  @author crash         crash_wu@163.com   , 16-08-23 10:08:31
 *
 *  @brief  清除天地图图层
 *
 *  @param mapView 地图容器
 */
-(void)clearTdtLayer:(nonnull AGSMapView * ) mapView;


/**
 *  @author crash         crash_wu@163.com   , 16-08-23 10:08:49
 *
 *  @brief  加载天地图
 *
 *  @param tdtLayerType 天地图瓦片类型
 
 *  @param mapView      地图容器
 */
-(void)loadTdtTileLayer:(WMTSLayerTypes) tdtLayerType  andMapView :(nonnull AGSMapView * ) mapView;

/**
 *  @author crash         crash_wu@163.com   , 16-08-23 10:08:54
 *
 *  @brief  加载百度地图切片
 *
 *  @param mapView 地图
 */
-(void)loadBdTileLayer:(nonnull AGSMapView *)mapView;

/**
 *  @author crash         crash_wu@163.com   , 16-08-23 10:08:00
 *
 *  @brief  清除百度瓦片图层
 *
 *  @param mapView 地图容器
 */
-(void)clearBdLayer:(nonnull AGSMapView *)mapView;


/**
 *  @author crash         crash_wu@163.com   , 16-08-23 10:08:35
 *
 *  @brief  获取天地图当前图层级别
 *
 *  @param tdtLayer 天地图图层
 *
 *  @return 天地图当前图层级别
 */
-(NSInteger)currentLevel:(nonnull SouthgisTdt_TileLayer *)tdtLayer;


@end
