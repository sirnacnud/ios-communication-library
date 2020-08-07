// Created for NCCommunication in 2020
// Using Swift 5.0

import Foundation

@objc public class NCCommunicationBoardLabels: NSObject {
    
    @objc public var title = ""
    @objc public var color = ""
    @objc public var boardID: Int = 0
    @objc public var cardID: Int = 0
    @objc public var ID: Int = 0
    
}

@objc public class NCCommunicationBoardPermissions: NSObject {
    
    @objc public var PERMISSION_READ: Bool = false
    @objc public var PERMISSION_EDIT: Bool = false
    @objc public var PERMISSION_MANAGE: Bool = false
    @objc public var PERMISSION_SHARE: Bool = false
}

@objc public class NCCommunicationBoards: NSObject {
    
    @objc public var title = ""
    @objc public var ownerUID = ""
    @objc public var ownerDisplayName = ""
    @objc public var color = ""
    @objc public var archived: Bool = false
}
