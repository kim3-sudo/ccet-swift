//
//  DataStructures.swift
//  CCET
//
//  Created by Sejin Kim on 12/24/20.
//

import Foundation

class Date {
    public var year: Int64 = 0
    public var month: Int64 = 0
    public var day: Int64 = 0
}

class Time {
    public var hour: Int64 = 0
    public var minute: Int64 = 0
    public var second: Int64 = 0
}

class Score {
    public var reaction: Int64 = 999
    public var stmr: Int64 = 999
    public var gms: Int64 = 999
}

class ResultModel {
    public var id: Int64 = 0
    public var type: String = ""
    public var date: Date = Date()
    public var time: Time = Time()
    public var score: Score = Score()
}

class AbbrevResultModel {
    public var id: Int64 = 0
    public var type: String = ""
    public var score: Score = Score()
}
