//
//  RealmManager.swift
//  chatui-ios
//
//  Created by Franco Driansetti on 14/04/24.
//

import Foundation
import RealmSwift

class RealmManager {
    // Singleton instance
    static let shared = RealmManager()
    
    // Private initializer to prevent instantiation
    private init() {}
    
    // Realm configuration
    private lazy var realm: Realm? = {
        do {
            let config = Realm.Configuration()
            return try Realm(configuration: config)
        } catch {
            print("Error initializing Realm: \(error)")
            return nil
        }
    }()
    
    // Get the default Realm instance
    func getRealm() -> Realm? {
        return realm
    }
}
