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
    @EnvironmentObject var userVM: UserAuthModel
    
    var body: some View {
        NavigationView {
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
                        userVM.signIn()
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
                    
                    NavigationLink(destination: TabbarView(tabIndex: .list), isActive: $userVM.isLoggedIn) {
                    }
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(UserAuthModel())
    }
}
