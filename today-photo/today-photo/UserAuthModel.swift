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
        check()
    }
    
    func checkStatus() {
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
    
    func check() {
        GIDSignIn.sharedInstance.restorePreviousSignIn { _, error in
            guard error == nil else { return }
        }
        self.checkStatus()
    }
    
    func signIn() {
        guard let presentingViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {return}
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        let signInConfig = GIDConfiguration(clientID: clientID)
        
        GIDSignIn.sharedInstance.signIn(
            with: signInConfig,
            presenting: presentingViewController) { user, error in
                guard error == nil else { return }
                
                guard
                    let authentication = user?.authentication,
                    let idToken = authentication.idToken
                else { return }
                
                let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)
                
                Auth.auth().signIn(with: credential) { _, _ in
                // If sign in succeeded, display the app's main content View.
                }
                self.checkStatus()
            }
    }
    
    func signOut() {
        GIDSignIn.sharedInstance.signOut()
        self.checkStatus()
    }
    
}
