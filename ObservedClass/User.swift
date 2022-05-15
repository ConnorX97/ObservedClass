//
//  User.swift
//  ObservedClass
//
//  Created by Sherzod Fayziev on 2022/05/14.
//

import Foundation

struct User: Codable {
    var holderName: String
    var cardNumber: Int
    var accountBalance: Double
    var spendingLimit: Int
}
