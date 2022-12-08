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
    
    let diaryMakers = DiaryMaker.all()
    
    var body: some View {
    
        ZStack {
            bgColor
            NavigationView {
                List(self.diaryMakers, id: \.title) { diaryMaker in
                    ListCell(diaryMaker: diaryMaker)
                }
            }    .navigationBarTitle("Diary")
            VStack {

            }
           
        }
        .animation(.none)
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(title: "홈", bgColor: Color("lightPurple"))
       
    }
}

struct ListCell : View{
    let diaryMaker : DiaryMaker
    
    var body: some View{

            
          NavigationLink(destination: ContentView()) {
                  Image("sampleImg")
                      .resizable()
                      .frame(width: 350, height: 250)
                      .overlay(
                        HStack(alignment: .bottom) {
                            Rectangle()
                                .foregroundColor(.white)
                                .frame(width: 350, height: 125)
                                .overlay(
                                    HStack {
                                        VStack(alignment: .leading, spacing: 3) {
                                                    
                                            Text(diaryMaker.title)
                                                .frame(alignment: .leading)
                                                .font(.system(size: 20))
                                                .fontWeight(.bold)
                                                .foregroundColor(.black)
                                            HStack {
                                                Image("icon_pin")
                                                    .resizable()
                                                    .frame(width: 18, height: 20)
                                                    
                                                Text(diaryMaker.location)
                                                    .foregroundColor(Color(.gray))
                                                    .font(.system(size: 14))
                                            }
                                            HStack {
                                                Image("icon_music")
                                                    .resizable()
                                                    .frame(width: 20, height: 20)
                                             
                                                Text(diaryMaker.song)
                                                    .foregroundColor(Color(.gray))
                                                    .font(.system(size: 14))
                                            }
                                        }
                                        Spacer()
                                            .frame(width: 120)
                                    }
                              
                                )
                            
                        }
                        .padding(-10), alignment: .bottom)
                      .overlay(
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(width: 70, height: 70, alignment: .center)
                            .overlay(
                                VStack {
                                    Text(diaryMaker.diaryDate)
                                        .font(.system(size: 20))
                                        .foregroundColor(Color(.blue))
                                        .fontWeight(.bold)
                                    Text(diaryMaker.diaryDay)
                                        .font(.system(size: 14))
                                        .foregroundColor(Color(.black))
                                        .fontWeight(.bold)
                                }
                            )
                            .cornerRadius(15)
                            .shadow( radius: 10)
                            .padding(30), alignment: .leading)
                      .cornerRadius(20)
                      .shadow( radius: 10)
          
        }
    }
    
}
