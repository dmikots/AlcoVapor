//
//  File.swift
//  
//
//  Created by DariaMikots on 21.06.2022.
//

import Fluent

struct CreateCocktail: AsyncMigration {
    func prepare(on database: Database) async throws {
        return try await database.schema("cocktails")
            .field("id", .uuid, .identifier(auto: false))
            .field("name", .string, .required)
            .field("description", .string)
            .field("image", .string)
            .field("ingredient_id", .uuid, .references("ingredients", "id", onDelete: .cascade))
            .field("glass_id", .uuid, .references("glasses", "id", onDelete: .cascade))
            .field("updated_at", .datetime)
            .field("created_at", .datetime)
            .field("deleted_at", .datetime)
            .create()
    }

    func revert(on database: Database) async throws {
        return try await database.schema("cocktails").delete()
    }
}
