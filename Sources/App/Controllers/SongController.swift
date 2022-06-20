import Foundation
import Vapor
import Fluent

struct SongController: RouteCollection {
    func boot(routes: RoutesBuilder)  throws {
        let songs = routes.grouped("songs")
        songs.get(use: index)
        songs.post(use: create)
    }
    
    func index(_ req:Request) async throws -> [SongModel]  {
        return try await SongModel.query(on: req.db).all()
    }

    func create(_ req: Request) async  throws -> HTTPStatus {
        let song = try req.content.decode(SongModel.self)
        try await song.save(on: req.db)
        return .ok
    }
    
}
