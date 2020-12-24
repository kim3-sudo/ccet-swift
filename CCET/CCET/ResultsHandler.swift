//
//  ReadResultsData.swift
//  CCET
//
//  Created by Sejin Kim on 12/23/20.
//

import Foundation

struct date: Codable {
    var year: Int;
    var month: Int;
    var day: Int;
}

struct time: Codable {
    var hour: Int;
    var minute: Int;
    var second: Int;
}

struct results: Codable {
    var reaction: Int;
    var stmr: Int;
    var gmr: Int;
}

struct resultsdata: Codable {
    let type: String;
    let date: date;
    let time: time;
    let results: results;
}

class XMLReader {
    func read(infile: String) -> Data? {
        var parser : XMLParser?;
        if let path = Bundle.main.path(forResource: infile, ofType: "xml") {
            parser = XMLParser(contentsOf: URL(fileURLWithPath: path))
            if parser?.parse() ?? false {
                return XMLParser;
            } else {
                print("Unable to parse");
            }
        } else {
            print("File read error");
        }
    }
}
