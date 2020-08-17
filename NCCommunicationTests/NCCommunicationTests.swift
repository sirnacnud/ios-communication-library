//
//  NCCommunicationTests.swift
//  NCCommunicationTests
//
//  Created by Marino Faggiana on 21/10/2019.
//  Copyright © 2019 Marino Faggiana. All rights reserved.
//

import XCTest
@testable import NCCommunication

class NCCommunicationTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        NCCommunicationCommon.shared.setup(account: "test", user: "test", userId: "test", password: "Testing1231236", url: "https://cloud.purplecloud.xyz")
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        NCCommunication.shared.moveCard(boardID: 3, stackID: 7, cardID: 32, order: 2, newStackID: nil) {
            (account, cards, errorCode, errorDescription) in
            print(errorCode, errorDescription)
        }
    }
}
