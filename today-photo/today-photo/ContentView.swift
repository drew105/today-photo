//
//  ContentView.swift
//  today-photo
//
//  Created by 김동윤 on 2022/11/05.
//

import SwiftUI

struct ContentView: View {
    @State private var isPresented = false
    
    var body: some View {
        Button {
            self.isPresented.toggle()
        } label: {
            Text("WritingDiaryView")
        }
        .fullScreenCover(isPresented: $isPresented, content: CameraCoverView.init)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
