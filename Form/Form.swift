enum FormError: ErrorType {
    case NoSuchSection
}

class Form {
    var sections: [Section] = []
    
    func sectionWithIdentifier(identifier id: String) throws -> Section {
        let ss = sections.filter({$0.identifier == id})
        guard let s = ss.first else { throw FormError.NoSuchSection }
        return s
    }
    
    func setValue(value: String, forFieldWithIdentifier field: String, inSectionWithIdentifier section: String) throws {
        let s = try sectionWithIdentifier(identifier: section)
        let f = try s.fieldWithIdentifier(field)
        f.value = value
    }
    
    func valueForFieldWithIdentifier(field: String, inSectionWithIdentifier section: String) throws -> AnyObject? {
        let s = try sectionWithIdentifier(identifier: section)
        let f = try s.fieldWithIdentifier(field)
        return f.value
    }
}
