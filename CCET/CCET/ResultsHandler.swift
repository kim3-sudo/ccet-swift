//
//  ReadResultsData.swift
//  CCET
//
//  Created by Sejin Kim on 12/23/20.
//

import Foundation

class ResultsHandler {
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask);
        return paths[0];
    }
    /*
    func Read(infile: String) -> (type: String, year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int, reaction: Int, stmr: Int, gms: Int) {
        var propertyListFormat = PropertyListSerialization.PropertyListFormat.xml;
        var plistData: [String: AnyObject] = [:] // The data
        let plistPath: String? = Bundle.main.path(forResource: infile, ofType: "plist");
        let plistXML = FileManager.default.contents(atPath: plistPath!)!
        do { // Convert data to a dict and handle errors
            plistData = try PropertyListSerialization.propertyList(from: plistXML, options: .mutableContainersAndLeaves, format: &propertyListFormat) as! [String:AnyObject];
            return plistXML;
        } catch {
            print("Error reading plist: \(error), format: \(propertyListFormat)");
        }
    }
    */
    func Write(type: String, year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int, reaction: Int, stmr: Int, gms: Int) {
        let fileManager = FileManager.default;
        let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String;
        let outfile = year + month + day + hour + minute + second;
        let path = documentDirectory.appending(String("/AppData/" + String(outfile) + ".plist"));
        if (!fileManager.fileExists(atPath: path)) {
            print(path);
            let data : [String: String] = [
                "type": String(type),
                "year": String(year),
                "month": String(month),
                "day": String(day),
                "hour": String(hour),
                "minute": String(minute),
                "second": String(second),
                "reaction": String(reaction),
                "stmr": String(stmr),
                "gms": String(gms)
            ];
            let someData = NSDictionary(dictionary: data);
            let isWritten = someData.write(toFile: path, atomically: true);
            print("Is the file created: \(isWritten)");
            // Add the file to the index file for faster index page searching
            // Calculate the total score
            let total = Int(reaction) + Int(stmr) + Int(gms);
            // Create string to write
            let str = String(String(outfile) + "," + String(total));
            // Add to the index text file
            let filename = getDocumentsDirectory().appendingPathComponent("/AppData/resultsindex.ccetindex");
            do {
                try str.write(to: filename, atomically: true, encoding: String.Encoding.utf8);
            } catch {
                print("Failed to write to file!")
            }
        } else {
            print("File exists!");
        }
    }
    
    func getAll() -> Array<String> {
        // Get all results from the index text file
        do {
            let content = try String(contentsOfFile: "/AppData/resultsindex.ccetindex");
            let parsedCSV: [String] = content.components(
                separatedBy: "\n"
            ).map {$0.components(separatedBy: ",")[0] }
            return parsedCSV;
        } catch {
            return [];
        }
    }
}
