// Created for NCCommunication in 2020
// Using Swift 5.0

import Foundation

public struct NCCommunicationStacks: Codable {
    
}

public struct NCCommunicationLabels: Codable {
    var title = ""
    var color = ""
    var boardID: Int = 0
    var cardID: Int = 0
    var ID: Int = 0
}

public struct NCCommunicationBoardUsers: Codable {
    var primaryKey: String = ""
    var uid: String = ""
    var displayName: String = ""
    var type: Int = 0
}

public struct NCCommunicationBoards: Codable, Identifiable {
    public var title: String = ""
    public struct owner: Codable {
        public var primaryKey: String = ""
        public var uid: String = ""
        public var displayName: String = ""
        public var type: Int = 0
    }
    public var color: String = ""
    public var archived: Bool = false
    public var labels: [NCCommunicationLabels]
    public struct acl: Codable {
        public var participant: NCCommunicationBoardUsers
        public var type: Int = 0
        public var boardID: Int = 0
        public var permissionEdit: Bool = false
        public var permissionShare: Bool = false
        public var permissionManage: Bool = false
        public var owner: Bool = false
        public var id: Int = 0
    }
    public struct permissions: Codable {
        public var PERMISSION_READ: Bool = false
        public var PERMISSION_EDIT: Bool = false
        public var PERMISSION_MANAGE: Bool = false
        public var PERMISSION_SHARE: Bool = false
    }
    public var users: [NCCommunicationBoardUsers]
    public var shared: Int = 0
    public var stacks: [NCCommunicationStacks]
    public var deletedAt: Int = 0
    public var lastModified: Int = 0
    public var id: Int = 0
}
