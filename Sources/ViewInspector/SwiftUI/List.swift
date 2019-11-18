import SwiftUI

public extension ViewType {
    
    struct List: KnownViewType {
        public static let typePrefix: String = "List"
    }
}

public extension List {
    
    func inspect() throws -> InspectableView<ViewType.List> {
        return try InspectableView<ViewType.List>(self)
    }
}

// MARK: - MultipleViewContent

extension ViewType.List: MultipleViewContent {
    
    public static func content(view: Any) throws -> [Any] {
        let content = try Inspector.attribute(label: "content", value: view)
        return try Inspector.viewsInContainer(view: content)
    }
}

// MARK: - SingleViewContent

public extension InspectableView where View: SingleViewContent {
    
    func list() throws -> InspectableView<ViewType.List> {
        let content = try View.content(view: view)
        return try InspectableView<ViewType.List>(content)
    }
}

// MARK: - MultipleViewContent

public extension InspectableView where View: MultipleViewContent {
    
    func list(_ index: Int) throws -> InspectableView<ViewType.List> {
        let content = try contentView(at: index)
        return try InspectableView<ViewType.List>(content)
    }
}

// MARK: - Custom Attributes

public extension InspectableView where View == ViewType.List {
    //selection
}
