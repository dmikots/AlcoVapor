import Fluent

struct CreateEnums: AsyncMigration {
    static let enumValues: [String: [String]] = [
        "glass_type": GlassType.allCases.compactMap { $0.rawValue }
    ]

    func createEnum(schema: String, on database: Database) async throws {
        var enumBuilder = database.enum(schema)
        CreateEnums.enumValues[schema]?.forEach { value in
            enumBuilder = enumBuilder.case(value)
        }
        _ = try await enumBuilder.create()
    }

    func prepare(on database: Database) async throws {
        try await
            createEnum(schema: "glass_type", on: database)
    }

    func revert(on database: Database) async throws {
        try await database.enum("glass_type").delete()
    }
}
