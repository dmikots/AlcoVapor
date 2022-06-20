import Fluent
import Vapor

final class GlassModel: Model, Content {
    static let schema = "glasses"
    
    @ID(key: .id)
    var id: GlassUUID?

    @Field(key: .name)
    var name: String
    
    @OptionalField(key: .description)
    var description: String?
    
    @OptionalField(key: .image)
    var image: String?

    @Enum(key: .glassType)
    var glassType: GlassType
    
    @Children(for: \.$glass)
    var cocktailMany: [CocktailModel]

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
        cocktailID: CocktailModel.IDValue
    ){
        self.id = id
        self.name = name
        self.description = description
        self.image = image
        self.glassType = glassType
    }
}
