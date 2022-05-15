//
//  Defaults.swift
//  ObservedClass
//
//  Created by Sherzod Fayziev on 2022/05/14.
//

import Foundation
class Defaults: ObservableObject{
@Published var name: String {
    didSet {
        UserDefaults.standard.set(name, forKey: "name")
    }
}

@Published var user: User? {
    didSet {
        storeUser(user: user ?? User(holderName: "no name", cardNumber: 0, accountBalance: 0, spendingLimit: 0))
    }
}
init() {
    self.name = UserDefaults.standard.object(forKey: "name") as? String ?? ""
    self.user = loadUser()
}
func storeUser(user: User) {
    let encoder = JSONEncoder()
    if let encodedUser = try? encoder.encode(user) {
        UserDefaults.standard.set(encodedUser, forKey: "user")
    }
}

func loadUser()->User! {
    if let saveUserData = UserDefaults.standard.object(forKey: "user") as? Data {
        let decoder = JSONDecoder()
        if let savedUser = try? decoder.decode(User.self, from: saveUserData) {
            return savedUser
        }
        }
    return nil
    }
}
