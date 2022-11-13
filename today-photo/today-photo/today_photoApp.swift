//
//  today_photoApp.swift
//  today-photo
//
//  Created by 김동윤 on 2022/11/05.
//

import SwiftUI
import Firebase

@main
struct today_photoApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
