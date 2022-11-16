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
            VStack {
                HStack {
                    Text("Diary")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
                Text(title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text(title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text(title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
           
            Spacer()
         
        }
        .animation(.none)
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(title: "홈", bgColor: Color("lightPurple"))
       
    }
}
