//
//  URLConstants.m
//  Weather
//
//  Created by Rahul Lokhande on 27/09/23.
//

#import "URLConstants.h"


NSString * const kBaseURLString = @"https://api.openweathermap.org";
NSString * const apiKey = @"0fd18249e3e0c96dc79c5625e8e92280";
NSString * const kCoordinateURLString = @"%@/geo/1.0/direct?q=%@&limit=2&appid=%@";
NSString * const kWeatherURLEndpoint = @"%@/data/2.5/forecast/daily?lat=%@&lon=%@&cnt=7&units=metric&appid=%@";
NSString * const kWeatherIconEndpoint = @"https://openweathermap.org/img/wn/%@@2x.png";

