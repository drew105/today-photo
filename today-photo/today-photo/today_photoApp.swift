//
//  today_photoApp.swift
//  today-photo
//
//  Created by 김동윤 on 2022/11/05.
//

import SwiftUI
import Firebase
import GoogleSignIn

@main
struct today_photoApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL { url in
                    GIDSignIn.sharedInstance.handle(url)
                }
                .onAppear {
                    GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
                        if error != nil || user == nil {
                            
                        } else {
                            
                        }
                    }
                }
            TabbarView(tabIndex: .list)
        }
    }
}
