//
//  SettingView.swift
//  today-photo
//
//  Created by 조희라 on 2022/11/26.
//

import SwiftUI

struct SettingView: View {
    @EnvironmentObject var userVM: UserAuthModel
    
    var body: some View {
        ZStack {
            Color("lightPurple")
                .edgesIgnoringSafeArea(.bottom)
            
            VStack(spacing: 10) {
                Spacer().frame(height: 0)
                
                NavigationLink(destination: SettingUserView()) {
                    settingUserButton()
                        .foregroundColor(Color.black)
                }
                
                VStack(spacing: 1) {
                    listButton(name: "공지사항")
                    Link(destination: URL(string: "https://github.com/Swift-Coding-Club/today-photo")!) {
                        listButton(name: "개발자 웹사이트")
                            .foregroundColor(Color.black)
                    }
                    listButton(name: "문의하기")
                    listButton(name: "리뷰 쓰기")
                }
                
                VStack(spacing: 1) {
                    listButton(name: "개인정보 처리 방침")
                    verList()
                }
                
                Button {
                    userVM.signOut()
                } label: {
                    logoutButton()
                        .foregroundColor(Color.black)
                }
                
                Spacer()
            }
            .navigationBarBackButtonHidden()
            .navigationTitle("설정")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    @ViewBuilder
    func settingUserButton() -> some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .frame(width: 390, height: 78)
            HStack {
                AsyncImage(url: URL(string: userVM.profilePicUrl), scale: 2) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                } placeholder: {
                    Color.gray
                }
                    .frame(width: 47, height: 47)
                    .padding(.leading, 30)
                    .padding(.vertical, 15)
                
                VStack(alignment: .leading) {
                    Text(userVM.givenName)
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                        
                    Spacer().frame(height: 5)
                    Text("구글 계정 로그인")
                        .fontWeight(.regular)
                        .font(.system(size: 16))
                        .foregroundColor(Color.gray)
                }
                .padding(.leading, 10)
                Spacer()
                
                Image(systemName: "chevron.right")
                    .resizable()
                    .aspectRatio( contentMode: .fit)
                    .frame(height: 12)
                    .fontWeight(.bold)
                    .padding(.trailing, 39)
            }
        }
    }
    
    @ViewBuilder
    func listButton(name: String) -> some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .frame(width: 390, height: 48)
            HStack {
                Text(name)
                    .fontWeight(.medium)
                    .font(.system(size: 18))
                    .padding(.leading, 30)
                    .padding(.vertical, 13.5)
                Spacer()
                Image(systemName: "chevron.right")
                    .resizable()
                    .aspectRatio( contentMode: .fit)
                    .frame(height: 12)
                    .fontWeight(.bold)
                    .padding(.trailing, 39)
            }
        }
    }
    
    @ViewBuilder
    func verList() -> some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .frame(width: 390, height: 48)
            HStack {
                Text("버전 정보")
                    .fontWeight(.medium)
                    .font(.system(size: 18))
                    .padding(.leading, 30)
                    .padding(.vertical, 13.5)
                Spacer()
                Text("1.0.0")
                    .fontWeight(.light)
                    .padding(.trailing, 30)
            }
        }
    }
    
    @ViewBuilder
    func logoutButton() -> some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .frame(width: 390, height: 48)
            HStack {
                Text("로그아웃")
                    .fontWeight(.medium)
                    .font(.system(size: 18))
                    .padding(.leading, 30)
                    .padding(.vertical, 13.5)
                Spacer()
            }
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
            .environmentObject(UserAuthModel())
    }
}
