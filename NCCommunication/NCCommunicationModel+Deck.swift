// Created for NCCommunication in 2020
// Using Swift 5.0

import Foundation

public struct NCCommunicationDeckCards: Codable {
    public var title: String = ""
    public var description: String = ""
    public var stackId: Int = 0
    public var type: String = ""
    public var lastModified: Int = 0
    public var lastEditor: String?
    public var createdAt: Int = 0
    public var labels: [NCCommunicationDeckLabels] = []
    public var assignedUsers: [NCCommunicationDeckUsers] = []
    public var attachments: String?
    public var attachmentCount: Int = 0
    public var owner: NCCommunicationDeckUsers
    public var order: Int = 0
    public var archived: Bool = false
    public var dueDate: String?
    public var deletedAt: Int = 0
    public var commentsUnread: Int = 0
    public var id: Int = 0
    public var overdue: Int = 0
}

public struct NCCommunicationDeckStacks: Codable {
    public var title: String = ""
    public var boardId: Int = 0
    public var deletedAt: Int = 0
    public var lastModified: Int = 0
    public var cards: [NCCommunicationDeckCards]
    public var order: Int = 0
    public var id: Int = 0
}

public struct NCCommunicationDeckLabels: Codable {
    var title = ""
    var color = ""
    var boardId: Int = 0
    var cardId: Int?
    var id: Int = 0
}

public struct NCCommunicationDeckUsers: Codable {
    var primaryKey: String = ""
    var uid: String = ""
    var displayname: String = ""
    var type: Int = 0
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
        public var displayName: String = ""
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
