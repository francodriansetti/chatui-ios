//
//  MessageModelRealm.swift
//  chatui-ios
//
//  Created by Franco Driansetti on 14/04/24.
//

import Foundation
import RealmSwift

class MessageModelRealm: Object {
    @objc dynamic var text: String = ""
    @objc dynamic var timestamp: Date = Date()
    @objc dynamic var isSent: Bool = false
}
