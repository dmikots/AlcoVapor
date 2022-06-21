//
//  File.swift
//  
//
//  Created by DariaMikots on 21.06.2022.
//

import Fluent

struct CreateGlass: AsyncMigration {
    func prepare(on database: Database) async throws {
        let glassType = try await database.enum("glass_type").read()
        return try await database.schema("glasses")
            .field("id", .uuid, .identifier(auto: false))
            .field("name", .string, .required)
            .field("description", .string)
            .field("image", .string)
            .field("glass_type", glassType, .required)
            .field("updated_at", .datetime)
            .field("created_at", .datetime)
            .field("deleted_at", .datetime)
            .create()
    }

    func revert(on database: Database) async throws {
        return try await database.schema("glasses").delete()
    }
}
