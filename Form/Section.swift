enum SectionError: ErrorType {
    case NoSuchField
}

class Section {
    let identifier: String
    let header: String? = nil
    let footer: String? = nil
    var fields: [Field] = []
    init(identifier id: String) {
        identifier = id
    }
    func fieldWithIdentifier(id: String) throws -> Field {
        let ff = fields.filter({$0.identifier == id})
        guard let f = ff.first else { throw SectionError.NoSuchField }
        return f
    }
    func setValue(value v: String?, forFieldWithIdentifier id: String) throws {
        let field = try fieldWithIdentifier(id)
        field.value = v
    }
}
