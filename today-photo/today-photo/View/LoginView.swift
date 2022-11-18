//
//  LoginView.swift
//  today-photo
//
//  Created by 조희라 on 2022/11/16.
//

import SwiftUI
import Firebase
import GoogleSignIn
import GoogleSignInSwift

struct LoginView: View {
    var body: some View {
        ZStack {
            Color("lightPurple").ignoresSafeArea(.all)
            
            VStack {
                
                Spacer()
                
                Image("appLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 140)
                
                Spacer()
                
                Button {
                    handleSignInButton()
                } label: {
                    HStack {
                        Image("g-logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20)
                        Text("Google 계정으로 로그인")
                    }.frame(width: 295, height: 45)
                        .background(Color.white)
                        .cornerRadius(10)
                        .offset(y: -20)
                        .foregroundColor(Color.black)
                        .font(.system(size: 15))
                }
            }
        }
    }
    
    func handleSignInButton() {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        let signInConfig = GIDConfiguration(clientID: clientID)
        
        GIDSignIn.sharedInstance.signIn(
            with: signInConfig,
            presenting: getRootViewController()) { user, error in
                guard error == nil else { return }
                
                guard
                    let authentication = user?.authentication,
                    let idToken = authentication.idToken
                else { return }
                
                let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)
                
                Auth.auth().signIn(with: credential) { _, _ in
                // If sign in succeeded, display the app's main content View.
                }
            }
        
    }
    
    func getRootViewController() -> UIViewController {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .init()
        }
        
        guard let root = screen.windows.first?.rootViewController else {
            return .init()
        }
        
        return root
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
