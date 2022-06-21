//
//  File.swift
//  
//
//  Created by DariaMikots on 21.06.2022.
//

import Foundation
import Vapor
import Fluent

struct CocktailController: RouteCollection {
    func boot(routes: RoutesBuilder)  throws {
        let songs = routes.grouped("cocktails")
        songs.get(use: index)
    }
    
    func index(_ req:Request) async throws -> [CocktailModel]  {
        return try await CocktailModel.query(on: req.db).all()
    }
}
