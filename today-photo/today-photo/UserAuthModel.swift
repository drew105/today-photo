//
//  UserAuthModel.swift
//  today-photo
//
//  Created by 조희라 on 2022/11/18.
//

import SwiftUI
import Firebase
import GoogleSignIn

class UserAuthModel: ObservableObject {
    
    @Published var givenName: String = ""
    @Published var profilePicUrl: String = ""
    @Published var isLoggedIn: Bool = false
    @Published var errorMessage: String = ""
    
    init() {
        checkStatus()
    }
    
    func checkStatus() {
        GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
            guard error == nil else { return }
            
            if GIDSignIn.sharedInstance.currentUser != nil {
                let user = GIDSignIn.sharedInstance.currentUser
                guard let user = user else { return }
                
                let givenName = user.profile?.givenName
                let profilePicUrl = user.profile!.imageURL(withDimension: 100)!.absoluteString
                
                self.givenName = givenName ?? ""
                self.profilePicUrl = profilePicUrl
                self.isLoggedIn = true
            } else {
                self.givenName = ""
                self.profilePicUrl = ""
                self.isLoggedIn = false
            }
        }
    }
}
