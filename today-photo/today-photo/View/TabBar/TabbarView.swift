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
   // 탭바에 연결될 페이지 리턴
    @ViewBuilder
    func changeView(tabIndex: TabIndex) -> some View {
        switch tabIndex {
        case .list:
            AnyView(MainView(title: "listpage", bgColor: Color("lightPurple")))
        case .settings:
            AnyView(SettingView())
        case .write:
            AnyView(WritingDiaryView())
        }
    }
    
    func changeIconColor(tabIndex: TabIndex) -> Color {
        switch tabIndex {
        case .list:
            return Color("purple")
        case .settings:
            return Color.blue
        case .write:
            return Color.yellow
        }
    }
    
    var body: some View {
        
        GeometryReader { geom in
            ZStack(alignment: .bottom) {
                self.changeView(tabIndex: self.tabIndex)
                
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
                                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                                .frame(width: geom.size.width / 2, height: 50)                                
                                .foregroundColor(self.tabIndex == .list ? self.changeIconColor(tabIndex: self.tabIndex): Color.purple)
                                
                        }
                        .background(Color.white)
                        
                        Button(action: {
                            withAnimation {
                                self.tabIndex = .settings
                            }
                        }) {
                            Image("settings")
                                .resizable()
                                .aspectRatio(CGSize(width: 0.7, height: 0.7), contentMode: .fit)
                                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                                .frame(width: geom.size.width / 2, height: 50)
                                .foregroundColor(self.tabIndex == .write ? self.changeIconColor(tabIndex: self.tabIndex) : Color.gray)
                                
                        }
                        .background(Color.white)
                        // HStack
                    }
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(height: UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 0 : 10)
                }
                
                Button(action: {
                    withAnimation {
                        self.tabIndex = .write
                    }
                }) {
                    Image("edit")
                        .resizable()
                        .aspectRatio(CGSize(width: 0.5, height: 0.5), contentMode: .fit)
                        .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
                        .background(Color("purple"))
                        .clipShape(Circle())
                        .font(.largeTitle)
                        .offset(x: 0, y: -20)
                        .frame(width: 60, height: 60)
                        .foregroundColor(self.tabIndex == .settings ? self.changeIconColor(tabIndex: self.tabIndex) : Color.white)
                } .background(Color.white)
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView(tabIndex: .list)
    }
}
