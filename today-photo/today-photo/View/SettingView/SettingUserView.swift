//
//  SettingUserView.swift
//  today-photo
//
//  Created by 조희라 on 2022/12/03.
//

import SwiftUI

struct SettingUserView: View {
    @EnvironmentObject var userVM: UserAuthModel
    
    var body: some View {
        ZStack {
            Color("lightPurple")
                .edgesIgnoringSafeArea(.bottom)
            
            VStack {
                Spacer().frame(height: 30)
                
                AsyncImage(url: URL(string: userVM.profilePicUrl), scale: 2) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                } placeholder: {
                    Color.gray
                }
                .frame(width: 84, height: 84)
                .padding(.bottom, 10)
                
                Text(userVM.givenName)
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                
                Spacer().frame(height: 5)
                
                Text("구글 계정 로그인")
                    .fontWeight(.regular)
                    .font(.system(size: 16))
                    .foregroundColor(Color.gray)
                
                Spacer().frame(height: 30)
                
                listButton(name: "계정 삭제")
                    .foregroundColor(Color.red)
                
                Spacer()
            }
            .navigationTitle("계정 관리")
            .navigationBarTitleDisplayMode(.inline)
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
                    .foregroundColor(Color.black)
            }
        }
    }
}

struct SettingUserView_Previews: PreviewProvider {
    static var previews: some View {
        SettingUserView()
            .environmentObject(UserAuthModel())
    }
}
