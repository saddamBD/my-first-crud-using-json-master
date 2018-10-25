//
//  PeopleController.swift
//  App
//
//  Created by Saddam Hossain on 25/10/18.
//

import Vapor

final class PeopleController{
    
    // view the people list
    
    func list(_ req: Request) throws  -> Future<[People]> {
        return People.query(on: req).all()
    }
    
   
    func listById(_ req: Request) throws  -> Future<People> {
        return try req.parameters.next(People.self)
    }
    
    // create a new people bio
    
    func create(_ req: Request) throws -> Future<People> {
        return try req.content.decode(People.self).flatMap { user in
            return user.save(on: req)
        }
    }
    
    // update a user
    
    func update(_ req: Request) throws -> Future<People> {
        return try req.parameters.next(People.self).flatMap { user in
            return try req.content.decode(People.self).flatMap { newUser in
               user.id   = newUser.id
               user.name = newUser.name
               user.dict = newUser.dict
                return user.save(on: req)
            }
        }
    }
    
    // delete a people data
    func delete(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(People.self).flatMap { user in
            return user.delete(on: req)
            }.transform(to: .ok)
    }

    
}
