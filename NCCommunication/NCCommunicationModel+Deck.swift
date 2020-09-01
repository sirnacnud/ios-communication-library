// Created for NCCommunication in 2020
// Using Swift 5.0


import Foundation

public final class NCCommunicationDeckCards: NSObject, Codable, Identifiable, NSCopying {
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
    public var owner: NCCommunicationDeckUsers? = nil
    public var order: Int = 0
    public var archived: Bool = false
    public var duedate: String? = nil
    public var deletedAt: Int = 0
    public var commentsUnread: Int = 0
    public var id: Int = 0
    public var overdue: Int = 0
    
    enum CodingKeys: String, CodingKey {
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
    
    init(title: String, desc: String, stackID: Int, type: String, lastModified: Int, lastEditor: String?, createdAt: Int, labels: [NCCommunicationDeckLabels]?, assignedUsers: [NCCommunicationDeckUsers]?, attachments: String?, attachmentCount: Int?, owner: NCCommunicationDeckUsers?, order: Int, archived: Bool, duedate: String?, deletedAt: Int, commentsUnread: Int, id: Int, overdue: Int) {
        self.title = title
        self.desc = desc
        self.stackId = stackID
        self.type = type
        self.lastModified = lastModified
        self.lastEditor = lastEditor
        self.createdAt = createdAt
        self.labels = labels
        self.assignedUsers = assignedUsers
        self.attachments = attachments
        self.attachmentCount = attachmentCount
        self.owner = owner
        self.order = order
        self.archived = archived
        self.duedate = duedate
        self.deletedAt = deletedAt
        self.commentsUnread = commentsUnread
        self.id = id
        self.overdue = overdue
    }
    
    public func copy(with zone: NSZone? = nil) -> Any {
        let card = NCCommunicationDeckCards(title: self.title, desc: self.desc, stackID: self.stackId, type: self.type, lastModified: self.lastModified, lastEditor: self.lastEditor, createdAt: self.createdAt, labels: self.labels, assignedUsers: self.assignedUsers, attachments: self.attachments, attachmentCount: self.attachmentCount, owner: self.owner, order: self.order, archived: self.archived, duedate: self.duedate, deletedAt: self.deletedAt, commentsUnread: self.commentsUnread, id: self.id, overdue: self.overdue)
        return card
    }
}

public class NCCommunicationDeckCardsMin: Codable, Identifiable {
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
    public var owner: String? = nil
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

public struct NCCommunicationDeckPermissions: Codable {
    public var PERMISSION_READ: Bool = false
    public var PERMISSION_EDIT: Bool = false
    public var PERMISSION_MANAGE: Bool = false
    public var PERMISSION_SHARE: Bool = false
}

public struct NCCommunicationDeckBoards: Codable, Identifiable {
    public var title: String = ""
    public var owner: NCCommunicationDeckUsers
    public var permissions: NCCommunicationDeckPermissions
    public var color: String = ""
    public var archived: Bool = false
    public var labels: [NCCommunicationDeckLabels]
    public var acl: [NCCommunicationDeckACL]
    public var users: [NCCommunicationDeckUsers]
    public var shared: Int = 0
    public var stacks: [NCCommunicationDeckStacks]
    public var deletedAt: Int = 0
    public var lastModified: Int = 0
    public var id: Int = 0
}
