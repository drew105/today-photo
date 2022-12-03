//
//  TestView.swift
//  today-photo
//
//  Created by 조희라 on 2022/11/26.
//

import SwiftUI

struct TestView: View {
    @EnvironmentObject var userVM: UserAuthModel
    
    var body: some View {
        AsyncImage(url: URL(string: userVM.profilePicUrl))
        
        Text(userVM.givenName)
        
        Button {
            userVM.signOut()
        } label: {
            Text("로그아웃")
        }

    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
