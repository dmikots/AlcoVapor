//
//  File.swift
//  
//
//  Created by DariaMikots on 20.06.2022.
//
import Vapor
import Fluent
public extension FieldKey {
    // Добавил ключ? Не забудь добавить case для него!
    // 123_123 case
    // MARK: Glass

    static var name: Self { "name" }
    static var description: Self { "description" }
    static var image: Self { "image" }
    static var glassType: Self { "glass_type" }
    static var ingredientID: Self { "ingredient_id" }
    static var glassID: Self { "glass_id" }
    
    //MARK: - Default

    static var createdAt: Self { "created_at" }
    static var updatedAt: Self { "updated_at" }
    static var deletedAt: Self { "deleted_at" }

    // MARK: Error field

    static var errorField: Self { "error_field" }

    //asdADA case
     struct StringFieldKey {
        public init() {}
        public subscript(key: String) -> FieldKey {
            switch key {
                // MARK: Glass
            case "name": return .name
            case "description": return .description
            case "image": return .image
            case "glassType": return .glassType
            case "ingredientID": return .ingredientID
            case "glassID": return .glassID
                // MARK: General
                
            case "id": return .id
            case "createdAt": return .createdAt
            case "updatedAt": return .updatedAt
            case "deletedAt": return .deletedAt
            default: return .errorField
            }
        }
    }
}
