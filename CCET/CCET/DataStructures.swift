//
//  DataStructures.swift
//  CCET
//
//  Created by Sejin Kim on 12/24/20.
//

import Foundation

struct Date {
    var year: Int
    var month: Int
    var day: Int
}

struct Time {
    var hour: Int
    var minute: Int
    var second: Int
}

struct Score {
    var reaction: Int
    var stmr: Int
    var gms: Int
}

struct Result {
    var type: String
    var date: Date
    var time: Time
    var score: Score
}
