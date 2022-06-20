//
//  File.swift
//  
//
//  Created by DariaMikots on 20.06.2022.
//

import Fluent
import Vapor

final class CocktailModel: Model, Content {
    static let schema = "cocktails"
    
    @ID(key: .id)
    var id: CocktailUUID?

    @Field(key: .name)
    var name: String
    
    @OptionalField(key: .description)
    var description: String?
    
    @OptionalField(key: .image)
    var image: String?

    @Parent(key: .ingredientID)
    var ingredient: IngredientModel
    
    @Parent(key: .glassID)
    var glass: GlassModel
    
    
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
        image: String?,
        glassType: GlassType,
        ingredientID: IngredientModel.IDValue,
        glassID: GlassModel.IDValue
    ){
        self.id = id
        self.name = name
        self.description = description
        self.image = image
        self.$ingredient.id = ingredientID
        self.$glass.id = glassID
    }
}
