//
//  File.swift
//  
//
//  Created by DariaMikots on 20.06.2022.
//
import Fluent
import Vapor

final class IngredientModel: Model, Content {
    static let schema = "ingredients"
    
    @ID(key: .id)
    var id: IngredientUUID?

    @Field(key: .name)
    var name: String
    
    @OptionalField(key: .description)
    var description: String?
    
    @OptionalField(key: .image)
    var image: String?

    @Children(for: \.$ingredient)
    var coctailsMany: [CocktailModel]
    
    @Timestamp(key: .createdAt, on: .create)
    var createdAt: Date?

    @Timestamp(key: .updatedAt, on: .update)
    var updatedAt: Date?

    @Timestamp(key: .deletedAt, on: .delete)
    var deletedAt: Date?
    
    init() {}
    
    init(
        id: UUID? = nil,
        name: String,
        description: String?,
        image: String?
    ){
        self.id = id
        self.name = name
        self.description = description
        self.image = image
    }
}
