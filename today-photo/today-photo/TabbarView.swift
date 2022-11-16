//
//  TabbarView.swift
//  today-photo
//
//  Created by daseul on 2022/11/15.
//

import SwiftUI

struct TabbarView: View {
    
    enum TabIndex {
        case list, write, settings
    }
    
    @State var tabIndex: TabIndex
   
    
    
    func ChangeView(tabIndex: TabIndex) -> MainView {
        switch tabIndex {
        case .list:
            return MainView(title: "listpage", bgColor: Color.red)
        case .settings:
            return MainView(title: "write", bgColor: Color.blue)
        case .write:
            return MainView(title: "settings", bgColor: Color.yellow)
        default:
            return
                MainView(title: "listpage", bgColor: Color.red)
        }
    }
    
    func ChangeIconColor(tabIndex: TabIndex) -> Color {
        switch tabIndex {
        case .list:
            return Color.red
        case .settings:
            return Color.blue
        case .write:
            return Color.yellow
        default:
            return Color.red
        }
    }
    
    
    var body: some View {
        
        GeometryReader { geo in
            ZStack(alignment: .bottom) {
                self.ChangeView(tabIndex: self.tabIndex)
                
   
                    
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        Button(action: {
                            withAnimation {
                                self.tabIndex = .list
                            }
                        }) {
                            
                            Image("book")
                                .resizable()
                                .aspectRatio(CGSize(width: 0.5, height: 0.5), contentMode: .fit)
                                .frame(width: geo.size.width / 2, height: 50)
                                
                                .foregroundColor(self.tabIndex == .list ? self.ChangeIconColor(tabIndex: self.tabIndex): Color.purple)
                                
                        }
                        .background(Color.white)
                        

//                        Spacer()
//                            .frame(width: geo.size.width / 3, height: 50)
//                            .background(Color.white)
                        
                        
                        Button(action: {
                            withAnimation {
                                self.tabIndex = .write
                            }
                            
                        }) {
                            
                            Image("settings")
                                .resizable()
                                .aspectRatio(CGSize(width: 0.7, height: 0.7), contentMode: .fit)
                                .frame(width: geo.size.width / 2, height: 50)
                                .foregroundColor(self.tabIndex == .write ? self.ChangeIconColor(tabIndex: self.tabIndex) : Color.gray)
                                
                        }
                        .background(Color.white)
                        //HStack
                    }
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(height: UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 0 : 10)
                }
                
                
                Button(action: {
                    withAnimation {
                        self.tabIndex = .settings

                    }
                }) {

                    Image("edit")
                        .resizable()
                        .aspectRatio(CGSize(width: 0.5, height: 0.5), contentMode: .fit)
                        .background(Color.purple)
                        .clipShape(Circle())
                        .font(.largeTitle)
                        .offset(x:0, y: -20)
                        .frame(width: 60, height: 60)

                        .foregroundColor(self.tabIndex == .settings ? self.ChangeIconColor(tabIndex: self.tabIndex) : Color.white)
                        

                } .background(Color.white)
            }
            
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView(tabIndex: .list)
    }
}

