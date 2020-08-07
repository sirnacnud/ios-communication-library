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

public struct NCCommunicationBoards: Codable {
    var title: String = ""
    struct owner: Codable {
        var primaryKey: String = ""
        var uid: String = ""
        var displayName: String = ""
        var type: Int = 0
    }
    var color: String = ""
    var archived: Bool = false
    var labels: [NCCommunicationLabels]
    struct acl: Codable {
        var participant: NCCommunicationBoardUsers
        var type: Int = 0
        var boardID: Int = 0
        var permissionEdit: Bool = false
        var permissionShare: Bool = false
        var permissionManage: Bool = false
        var owner: Bool = false
        var id: Int = 0
    }
    struct permissions: Codable {
        var PERMISSION_READ: Bool = false
        var PERMISSION_EDIT: Bool = false
        var PERMISSION_MANAGE: Bool = false
        var PERMISSION_SHARE: Bool = false
    }
    var users: [NCCommunicationBoardUsers]
    var shared: Int = 0
    var stacks: [NCCommunicationStacks]
    var deletedAt: Int = 0
    var lastModified: Int = 0
    var id: Int = 0
}
