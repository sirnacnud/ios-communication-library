// Created for NCCommunication in 2020
// Using Swift 5.0

import Foundation

// Created for iOS Deck in 2020
// Using Swift 5.0

public final class NCCommunicationDeckCards: NSObject, NSItemProviderReading, NSItemProviderWriting, Codable {
    public static func object(withItemProviderData data: Data, typeIdentifier: String) throws -> NCCommunicationDeckCards {
        let decoder = JSONDecoder()
        let decodedCard = try decoder.decode(NCCommunicationDeckCards.self, from: data)
        return decodedCard
    }
    
    public static var writableTypeIdentifiersForItemProvider: [String] {
        return ["com.nextcloud.deck.cards"]
    }
    
    public func loadData(withTypeIdentifier typeIdentifier: String, forItemProviderCompletionHandler completionHandler: @escaping (Data?, Error?) -> Void) -> Progress? {
        let progress = Progress(totalUnitCount: 100)
        do {
            let data = try JSONEncoder().encode(self)
            progress.completedUnitCount = 100
            completionHandler(data, nil)
        } catch {
            completionHandler(nil, error)
        }

        return progress
        
    }
    
    public static var readableTypeIdentifiersForItemProvider: [String] {
        return ["com.nextcloud.deck.cards"]
    }
    
    public var title: String = ""
    public var desc: String = ""
    public var stackId: Int = 0
    public var type: String = ""
    public var lastModified: Int = 0
    public var lastEditor: String? = nil
    public var createdAt: Int = 0
    public var labels: [NCCommunicationDeckLabels] = []
    public var assignedUsers: [NCCommunicationDeckUsers] = []
    public var attachments: String?
    public var attachmentCount: Int = 0
    public var owner: NCCommunicationDeckUsers
    public var order: Int = 0
    public var archived: Bool = false
    public var duedate: String? = nil
    public var deletedAt: Int = 0
    public var commentsUnread: Int = 0
    public var id: Int = 0
    public var overdue: Int = 0

    init(_ title: String, _ description: String, _ stackId: Int, _ type: String, _ lastModified: Int, _ lastEditor: String?, _ createdAt: Int, _ labels: [NCCommunicationDeckLabels], _ assignedUsers: [NCCommunicationDeckUsers], _ attachments: String?, attachmentCount: Int, owner: NCCommunicationDeckUsers, _ order: Int, _ archived: Bool, _ duedate: String?, _ deletedAt: Int, _ commentsUnread: Int, _ id: Int, _ overdue: Int) {
        self.title = title
        self.desc = description
        self.stackId = stackId
        self.type = type
        self.lastModified = lastModified
        self.lastEditor = lastEditor
        self.createdAt = createdAt
        self.labels = labels
        self.assignedUsers = assignedUsers
        self.attachments = attachments
        self.attachmentCount = attachmentCount
        self.owner = owner
        self.archived = archived
        self.duedate = duedate
        self.deletedAt = deletedAt
        self.commentsUnread = commentsUnread
        self.id = id
        self.overdue = overdue
    }
}


//public struct NCCommunicationDeckCards: Codable, Identifiable {
//    public var title: String = ""
//    public var description: String = ""
//    public var stackId: Int = 0
//    public var type: String = ""
//    public var lastModified: Int = 0
//    public var lastEditor: String?
//    public var createdAt: Int = 0
//    public var labels: [NCCommunicationDeckLabels] = []
//    public var assignedUsers: [NCCommunicationDeckUsers] = []
//    public var attachments: String?
//    public var attachmentCount: Int = 0
//    public struct owner: Codable {
//        public var primaryKey: String = ""
//        public var uid: String = ""
//        public var displayname: String = ""
//        public var type: Int = 0
//    }
//    public var order: Int = 0
//    public var archived: Bool = false
//    public var duedate: String?
//    public var deletedAt: Int = 0
//    public var commentsUnread: Int = 0
//    public var id: Int = 0
//    public var overdue: Int = 0
//}

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
