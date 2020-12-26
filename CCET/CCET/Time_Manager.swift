//
//  Time_Manager.swift
//  CCET
//
//  Created by Sejin Kim on 12/25/20.
//

import Foundation

class Time_Manager {
    func getYear() -> Int64 {
        let date = Foundation.Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        
        let year = components.year
        
        let year_int:Int64 = Int64(year!)
        
        return year_int
    }
    
    func getMonth() -> Int64 {
        let date = Foundation.Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        
        let month = components.month
        
        let month_int:Int64 = Int64(month!)
        
        return month_int
    }
    
    func getDay() -> Int64 {
        let date = Foundation.Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        
        let day = components.day
        
        let day_int:Int64 = Int64(day!)
        
        return day_int
    }
    
    func getHour() -> Int64 {
        let date = Foundation.Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        
        let hour = components.hour
        
        let hour_int:Int64 = Int64(hour!)
        
        return hour_int
    }
    
    func getMinute() -> Int64 {
        let date = Foundation.Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        
        let minute = components.minute
        
        let minute_int:Int64 = Int64(minute!)
        
        return minute_int
    }
    
    func getSecond() -> Int64 {
        let date = Foundation.Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        
        let second = components.second
        
        let second_int:Int64 = Int64(second!)
        
        return second_int
    }
}
