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
//                HStack {
//                    Text("Diary")
//                        .font(.largeTitle)
//                        .fontWeight(.bold)
//                        .foregroundColor(.black)
//
//                    Spacer()
//                        .frame(width: 80)
//
//                    Button(action: {
//                        withAnimation {
//                        }
//                    }) {
//                        Image("btn_prev_purp")
//                            .resizable()
//                            .aspectRatio(CGSize(width: 0.7, height: 0.7), contentMode: .fit)
//                            .frame(width: 50, height: 50)
//                    }
//                    Text("2022.11")
//                        .font(.title2)
//                        .fontWeight(.bold)
//                        .foregroundColor(Color("purple"))
//                        .frame(width: 100, height: 50)
//                    Button(action: {
//                        withAnimation {
//                        }
//                    }) {
//                        Image("btn_next_purp")
//                            .resizable()
//                            .aspectRatio(CGSize(width: 0.7, height: 0.7), contentMode: .fit)
//                            .frame(width: 50, height: 50)
//                    }
//
//                }
                VStack {
                    NavigationView {
                      NavigationLink(destination: ContentView()) {
                              Image("sampleImg")
                                  .resizable()
                                  .frame(width: 350, height: 250)
                                  .overlay(
                                    HStack(alignment: .bottom){
                                        Rectangle()
                                            .foregroundColor(.white)
                                            .frame(width: 350, height: 125)
                                            .overlay(
                                                VStack{
                                                 
                                                            
                                                    Text("일기제목")
                                                        .frame(alignment: .leading)
                                                        .font(.system(size: 20))
                                                        .fontWeight(.bold)
                                                        .foregroundColor(.black)
                                                    HStack{
                                                        Image("icon_pin")
                                                            .resizable()
                                                            .aspectRatio(CGSize(width: 1, height: 1), contentMode: .fit)
                                                            .padding(EdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 0))
                                                            
                                                        Text("서울특별시 종로구")
                                                            .foregroundColor(Color(.gray))
                                                            .font(.system(size: 14))
                                                    }
                                                    HStack{
                                                        Image("icon_music")
                                                            .resizable()
                                                            .aspectRatio(CGSize(width: 1, height: 1), contentMode: .fit)
                                                            .padding(EdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 0))
                                                        Text("노래-가수")
                                                            .foregroundColor(Color(.gray))
                                                            .font(.system(size: 14))
                                                    }
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
                                                Text("01")
                                                    .font(.system(size: 20))
                                                    .foregroundColor(Color(.blue))
                                                    .fontWeight(.bold)
                                                Text("Tue")
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
                          
                      }.navigationBarTitle("Diary")
                    }// NV
                   
                }
                
                Spacer()
                    .frame(height: 40)
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
