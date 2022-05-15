//
//  ContentView.swift
//  ObservedClass
//
//  Created by Sherzod Fayziev on 2022/05/14.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var defs = Defaults()
    @State var text = "no data"
    
    init() {
        print(defs.loadUser()as Any)
        let user = User(holderName: "CardMan", cardNumber: 11997722, accountBalance: 3002.334, spendingLimit: 5000)
        defs.user = user
        print(defs.loadUser()as Any)
    }
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
