//
//  ContentView.swift
//  today-photo
//
//  Created by 김동윤 on 2022/11/05.
//

import SwiftUI

struct ContentView: View {
    @StateObject var userAuth: UserAuthModel = UserAuthModel()
    
    var body: some View {
        LoginView()
            .environmentObject(userAuth)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
