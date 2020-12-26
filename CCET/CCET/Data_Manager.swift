//
//  Data_Manager.swift
//  CCET
//
//  Created by Sejin Kim on 12/25/20.
//

import Foundation

class Data_Manager{
    public func CalcScore(reactionScore:Int64, stmrScore: Int64, gmsScore: Int64) -> Int64 {
        return reactionScore + stmrScore + gmsScore
    }
    
    public func LongMode(exammode: String) -> String {
        if exammode == "crash" {
            return "Crash concussion test"
        } else if exammode == "rest" {
            return "Resting baseline test"
        } else if exammode == "active" {
            return "Active baseline test"
        }
        return ""
    }
}
