//
//  People.swift
//  App
//
//  Created by Saddam Hossain on 25/10/18.
//

import FluentSQLite
import Vapor

final class People: SQLiteModel {
    var id: Int?
    var name: String
    var dict: String?
    init(id: Int, name: String, dict: String) {
        self.id = id
        self.name = name
        self.dict = dict
    }
}
extension People: Content {}
extension People: Migration {}
extension People: Parameter {}

