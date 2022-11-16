//
//  MainView.swift
//  today-photo
//
//  Created by daseul on 2022/11/15.
//

import SwiftUI

struct MainView: View {
    
    var title: String
    var bgColor: Color
    
    var body: some View {
    
        ZStack {
            bgColor
                .edgesIgnoringSafeArea(.all)
            
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .animation(.none)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(title: "홈", bgColor: Color.yellow)
       
    }
}
