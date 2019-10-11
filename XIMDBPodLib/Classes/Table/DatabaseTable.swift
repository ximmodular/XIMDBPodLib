//
//  DatabaseTable.swift
//  XIMDBPodLib_Example
//
//  Created by xiaofengmin on 2019/10/9.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import FMDB

protocol DatabaseTableProtocol: AnyObject {
    var databaseName:String { get }
    var tableName:String { get }
    var columInfos:[String:ColumInfo] { get }
    var primaryKeyName:String { get }
}

struct ColumInfo {
//    let name:String
    let type:ColumType
    var nullable:Bool = true
    var info: String { get {
        let nullStateStr = nullable ? "" : "not null"
        return "\(type.description) \(nullStateStr)"
        }
    }
}

enum ColumType:CustomStringConvertible {
    case text
    case integer
    
    var description: String {
        switch self {
        case .text:
            return "text"
        case .integer:
            return "integer"
        }
    }
    
}

class DatabaseTable: NSObject {
    lazy var queryCommand:QueryCommand! = {
        let queryCommand = QueryCommand.init(tb: (self as! DatabaseTableProtocol))
        return queryCommand
    }()
    
    private func config(_ queryCommand:QueryCommand) -> Void {
        let state = queryCommand.creatTable()
    }
    
    override init() {
        super.init()
        config(queryCommand!)
    }
    
    
    func excute(sql:String) -> Bool {
        queryCommand.excute(sql: sql)
    }
    
    func fetch(sql:String) -> [FMResultSet] {
        return queryCommand.fetch(sql: sql)
        
    }
    
    func insert(conditions:[String:Any]) -> Bool {
        return queryCommand.insert(conditions: conditions)
    }
    
    func update(conditions:[String:Any], whereString:String, whereValue:Any) -> Bool {
        return queryCommand.update(conditions: conditions, whereString: whereString, whereValue: whereValue)
    }
    
    //FMResultSet need to remove
    func search(whereString:String, whereValue:Any, parseFunc:(FMResultSet) -> Any) -> [Any]! {
        return queryCommand.search(whereString: whereString, whereValue: whereValue, parseFunc: parseFunc)
    }
    
    func delete(whereString:String, whereValue:Any) -> Void {
        return queryCommand.delete(whereString: whereString, whereValue: whereValue)
    }
    
    func clear() {
        return queryCommand.clear()
    }
    
}
