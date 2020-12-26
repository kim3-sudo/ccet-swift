//
//  DB_Manager.swift
//  CCET
//
//  Created by Sejin Kim on 12/24/20.
//

// Reference: https://adnan-tech.com/create-read-update-and-delete-from-sqlite-swift-swift-ui/

import Foundation
import SQLite

class DB_Manager {
    // Create SQLite instance
    private var db: Connection!
    
    // Create table instance
    private var results: Table!
    
    // Create column instances for the results table, based on data structures defined in DataStructures.swift
    private var id: Expression<Int64>!
    private var type: Expression<String>!
    private var year: Expression<Int64>!
    private var month: Expression<Int64>!
    private var day: Expression<Int64>!
    private var hour: Expression<Int64>!
    private var minute: Expression<Int64>!
    private var second: Expression<Int64>!
    private var reaction: Expression<Int64>!
    private var stmr: Expression<Int64>!
    private var gms: Expression<Int64>!
    
    // Default constructor for the class
    init () {
        // Exception handling
        do {
            // Path of the document directory
            let path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first ?? ""
            
            // Create a database connection
            db = try Connection("\(path)/my_results.sqlite3")
            
            // Create a table object
            results = Table("results")
            
            // Create instances of each column
            id = Expression<Int64>("id")
            type = Expression<String>("type")
            year = Expression<Int64>("year")
            month = Expression<Int64>("month")
            day = Expression<Int64>("day")
            hour = Expression<Int64>("hour")
            minute = Expression<Int64>("minute")
            second = Expression<Int64>("second")
            reaction = Expression<Int64>("reaction")
            stmr = Expression<Int64>("stmr")
            gms = Expression<Int64>("gms")
            
            // Check if the user already has a table
            if (!UserDefaults.standard.bool(forKey: "is_db_created")) {
                // If not, then create the table
                try db.run(results.create { (t) in
                    t.column(id, primaryKey: true)
                    t.column(type)
                    t.column(year)
                    t.column(month)
                    t.column(day)
                    t.column(hour)
                    t.column(minute)
                    t.column(second)
                    t.column(reaction)
                    t.column(stmr)
                    t.column(gms)
                })
                
                // Set the value to true so it will not attempt another table creation
                UserDefaults.standard.set(true, forKey: "is_db_created")
            }
        } catch {
            // Show error message, if any
            print(error.localizedDescription)
        }
    }
    
    // Function to add a new result
    func AddResult(typeValue: String, yearValue: Int64, monthValue: Int64, dayValue: Int64, hourValue: Int64, minuteValue: Int64, secondValue: Int64, reactionValue: Int64, stmrValue: Int64, gmsValue: Int64) {
        do {
            // Try to insert a new result line
            try db.run(results.insert(type <- typeValue, year <- yearValue, month <- monthValue, day <- dayValue, hour <- hourValue, minute <- minuteValue, second <- secondValue, reaction <- reactionValue, stmr <- stmrValue, gms <- gmsValue))
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // Function to get types and total scores from database
    public func GetAbbrevData() -> [AbbrevResultModel] {
        // Create empty array for data
        var resultModels: [AbbrevResultModel] = []
        
        // Get all results in descending order
        results = results.order(id.desc)
        
        // Exception handling
        do {
            // Loop through all of the results
            for result in try db.prepare(results) {
                // Create a new model in each loop iteration
                let resultModel: AbbrevResultModel = AbbrevResultModel()
                
                // Set values in model from database
                resultModel.id = result[id]
                resultModel.type = result[type]
                resultModel.score.reaction = result[stmr]
                resultModel.score.stmr = result[stmr]
                resultModel.score.gms = result[gms]
                
                // append in new array
                resultModels.append(resultModel)
            }
        } catch {
            print(error.localizedDescription)
        }
        
        // Return the array
        return resultModels
    }
    
    // Function to get all data from one test from database
    public func GetDetailedData(idValue: Int64) -> ResultModel {
        // Create empty array for the data
        let resultModel: ResultModel = ResultModel()
        
        // Exception handling
        do {
            // Get result by ID, passed in as idValue
            let result: AnySequence<Row> = try db.prepare(results.filter(id == idValue))
            
            // Get the entire row's data
            try result.forEach({ (rowValue) in
                // Set values in model
                resultModel.id = try rowValue.get(id)
                resultModel.type = try rowValue.get(type)
                resultModel.date.year = try rowValue.get(year)
                resultModel.date.month = try rowValue.get(month)
                resultModel.date.day = try rowValue.get(day)
                resultModel.time.hour = try rowValue.get(hour)
                resultModel.time.minute = try rowValue.get(minute)
                resultModel.time.second = try rowValue.get(second)
                resultModel.score.reaction = try rowValue.get(reaction)
                resultModel.score.stmr = try rowValue.get(stmr)
                resultModel.score.gms = try rowValue.get(gms)
            })
        } catch {
            print(error.localizedDescription)
        }
        
        // Return the model
        return resultModel
    }
    
    public func GetType(idValue: Int64) -> String {
        // Define empty string
        var resultType: String
        // Create empty array for the data
        let resultModel: ResultModel = ResultModel()
        
        // Exception handling
        do {
            // Get result by ID, passed in as idValue
            let result: AnySequence<Row> = try db.prepare(results.filter(id == idValue))
            
            // Get the entire row's data
            try result.forEach({ (rowValue) in
                resultModel.id = try rowValue.get(id)
                resultModel.type = try rowValue.get(type)
            })
        } catch {
            print(error.localizedDescription)
        }
        resultType = resultModel.type
        return resultType
    }
    
    public func GetYear(idValue: Int64) -> Int64 {
        // Define empty string
        var resultYear: Int64
        // Create empty array for the data
        let resultModel: ResultModel = ResultModel()
        
        // Exception handling
        do {
            // Get result by ID, passed in as idValue
            let result: AnySequence<Row> = try db.prepare(results.filter(id == idValue))
            
            // Get the entire row's data
            try result.forEach({ (rowValue) in
                resultModel.id = try rowValue.get(id)
                resultModel.date.year = try rowValue.get(year)
            })
        } catch {
            print(error.localizedDescription)
        }
        resultYear = resultModel.date.year
        return resultYear
    }
    
    public func GetMonth(idValue: Int64) -> Int64 {
        // Define empty string
        var resultMonth: Int64
        // Create empty array for the data
        let resultModel: ResultModel = ResultModel()
        
        // Exception handling
        do {
            // Get result by ID, passed in as idValue
            let result: AnySequence<Row> = try db.prepare(results.filter(id == idValue))
            
            // Get the entire row's data
            try result.forEach({ (rowValue) in
                resultModel.id = try rowValue.get(id)
                resultModel.date.month = try rowValue.get(month)
            })
        } catch {
            print(error.localizedDescription)
        }
        resultMonth = resultModel.date.month
        return resultMonth
    }
    
    public func GetDay(idValue: Int64) -> Int64 {
        // Define empty string
        var resultDay: Int64
        // Create empty array for the data
        let resultModel: ResultModel = ResultModel()
        
        // Exception handling
        do {
            // Get result by ID, passed in as idValue
            let result: AnySequence<Row> = try db.prepare(results.filter(id == idValue))
            
            // Get the entire row's data
            try result.forEach({ (rowValue) in
                resultModel.id = try rowValue.get(id)
                resultModel.date.day = try rowValue.get(day)
            })
        } catch {
            print(error.localizedDescription)
        }
        resultDay = resultModel.date.day
        return resultDay
    }
    
    public func GetHour(idValue: Int64) -> Int64 {
        // Define empty string
        var resultHour: Int64
        // Create empty array for the data
        let resultModel: ResultModel = ResultModel()
        
        // Exception handling
        do {
            // Get result by ID, passed in as idValue
            let result: AnySequence<Row> = try db.prepare(results.filter(id == idValue))
            
            // Get the entire row's data
            try result.forEach({ (rowValue) in
                resultModel.id = try rowValue.get(id)
                resultModel.time.hour = try rowValue.get(hour)
            })
        } catch {
            print(error.localizedDescription)
        }
        resultHour = resultModel.time.hour
        return resultHour
    }
    
    public func GetMinute(idValue: Int64) -> Int64 {
        // Define empty string
        var resultMinute: Int64
        // Create empty array for the data
        let resultModel: ResultModel = ResultModel()
        
        // Exception handling
        do {
            // Get result by ID, passed in as idValue
            let result: AnySequence<Row> = try db.prepare(results.filter(id == idValue))
            
            // Get the entire row's data
            try result.forEach({ (rowValue) in
                resultModel.id = try rowValue.get(id)
                resultModel.time.minute = try rowValue.get(minute)
            })
        } catch {
            print(error.localizedDescription)
        }
        resultMinute = resultModel.time.minute
        return resultMinute
    }
    
    public func GetSecond(idValue: Int64) -> Int64 {
        // Define empty string
        var resultSecond: Int64
        // Create empty array for the data
        let resultModel: ResultModel = ResultModel()
        
        // Exception handling
        do {
            // Get result by ID, passed in as idValue
            let result: AnySequence<Row> = try db.prepare(results.filter(id == idValue))
            
            // Get the entire row's data
            try result.forEach({ (rowValue) in
                resultModel.id = try rowValue.get(id)
                resultModel.time.second = try rowValue.get(second)
            })
        } catch {
            print(error.localizedDescription)
        }
        resultSecond = resultModel.time.second
        return resultSecond
    }
    
    public func GetReaction(idValue: Int64) -> Int64 {
        // Define empty string
        var resultReaction: Int64
        // Create empty array for the data
        let resultModel: ResultModel = ResultModel()
        
        // Exception handling
        do {
            // Get result by ID, passed in as idValue
            let result: AnySequence<Row> = try db.prepare(results.filter(id == idValue))
            
            // Get the entire row's data
            try result.forEach({ (rowValue) in
                resultModel.id = try rowValue.get(id)
                resultModel.score.reaction = try rowValue.get(reaction)
            })
        } catch {
            print(error.localizedDescription)
        }
        resultReaction = resultModel.score.reaction
        return resultReaction
    }
    
    public func GetSTMR(idValue: Int64) -> Int64 {
        // Define empty string
        var resultSTMR: Int64
        // Create empty array for the data
        let resultModel: ResultModel = ResultModel()
        
        // Exception handling
        do {
            // Get result by ID, passed in as idValue
            let result: AnySequence<Row> = try db.prepare(results.filter(id == idValue))
            
            // Get the entire row's data
            try result.forEach({ (rowValue) in
                resultModel.id = try rowValue.get(id)
                resultModel.score.stmr = try rowValue.get(stmr)
            })
        } catch {
            print(error.localizedDescription)
        }
        resultSTMR = resultModel.score.stmr
        return resultSTMR
    }
    
    public func GetGMS(idValue: Int64) -> Int64 {
        // Define empty string
        var resultGMS: Int64
        // Create empty array for the data
        let resultModel: ResultModel = ResultModel()
        
        // Exception handling
        do {
            // Get result by ID, passed in as idValue
            let result: AnySequence<Row> = try db.prepare(results.filter(id == idValue))
            
            // Get the entire row's data
            try result.forEach({ (rowValue) in
                resultModel.id = try rowValue.get(id)
                resultModel.score.gms = try rowValue.get(gms)
            })
        } catch {
            print(error.localizedDescription)
        }
        resultGMS = resultModel.score.gms
        return resultGMS
    }
}
