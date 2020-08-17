// Created for NCCommunication in 2020
// Using Swift 5.0

import Foundation

public final class NCCommunicationDeckCards: NSObject, Codable, Identifiable {
    public var title: String = ""
    public var desc: String = ""
    public var stackId: Int = 0
    public var type: String = ""
    public var lastModified: Int = 0
    public var lastEditor: String? = nil
    public var createdAt: Int = 0
    public var labels: [NCCommunicationDeckLabels]? = []
    public var assignedUsers: [NCCommunicationDeckUsers]? = []
    public var attachments: String? = nil
    public var attachmentCount: Int? = 0
    public var owner: NCCommunicationDeckOwner? = nil
    public var order: Int = 0
    public var archived: Bool = false
    public var duedate: String? = nil
    public var deletedAt: Int = 0
    public var commentsUnread: Int = 0
    public var id: Int = 0
    public var overdue: Int = 0
    
    private enum CodingKeys: String, CodingKey {
        case title
        case desc = "description"
        case stackId
        case type
        case lastModified
        case lastEditor
        case createdAt
        case labels
        case assignedUsers
        case attachments
        case attachmentCount
        case owner
        case order
        case archived
        case duedate
        case deletedAt
        case commentsUnread
        case id
        case overdue
    }
}

public enum NCCommunicationDeckOwner: Codable {
    case string(String)
    case innerItem(NCCommunicationDeckUsers)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        if let x = try? container.decode(NCCommunicationDeckUsers.self) {
            self = .innerItem(x)
            return
        }
        throw DecodingError.typeMismatch(NCCommunicationDeckUsers.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for MyValue"))
    }
    
    public var innerItemValue: NCCommunicationDeckUsers? {
        switch self {
        case .innerItem(let ii):
            return ii
        default:
            return nil
        }
    }

    public var stringValue: String? {
        switch self {
        case .string(let s):
            return s
        default:
            return nil
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let x):
            try container.encode(x)
        case .innerItem(let x):
            try container.encode(x)
        }
    }
}

public struct NCCommunicationDeckStacks: Codable, Identifiable {
    public var title: String = ""
    public var boardId: Int = 0
    public var deletedAt: Int = 0
    public var lastModified: Int = 0
    public var cards: [NCCommunicationDeckCards]?
    public var order: Int = 0
    public var id: Int = 0
}

public struct NCCommunicationDeckLabels: Codable, Identifiable {
    public var title = ""
    public var color = ""
    public var boardId: Int = 0
    public var cardId: Int?
    public var id: Int = 0
}

public struct NCCommunicationDeckUsers: Codable {
    public var primaryKey: String = ""
    public var uid: String = ""
    public var displayname: String = ""
    public var type: Int = 0
}

public struct NCCommunicationDeckACL: Codable {
    public var participant: NCCommunicationDeckUsers
    public var type: Int = 0
    public var boardId: Int = 0
    public var permissionEdit: Bool = false
    public var permissionShare: Bool = false
    public var permissionManage: Bool = false
    public var owner: Bool = false
    public var id: Int = 0
}

public struct NCCommunicationDeckBoards: Codable, Identifiable {
    public var title: String = ""
    public struct owner: Codable {
        public var primaryKey: String = ""
        public var uid: String = ""
        public var displayname: String = ""
        public var type: Int = 0
    }
    public var color: String = ""
    public var archived: Bool = false
    public var labels: [NCCommunicationDeckLabels]
    public var acl: [NCCommunicationDeckACL]
    public struct permissions: Codable {
        public var PERMISSION_READ: Bool = false
        public var PERMISSION_EDIT: Bool = false
        public var PERMISSION_MANAGE: Bool = false
        public var PERMISSION_SHARE: Bool = false
    }
    public var users: [NCCommunicationDeckUsers]
    public var shared: Int = 0
    public var stacks: [NCCommunicationDeckStacks]
    public var deletedAt: Int = 0
    public var lastModified: Int = 0
    public var id: Int = 0
}
