//
//  WritingDiaryView.swift
//  today-photo
//
//  Created by 김동윤 on 2022/11/15.
//

import SwiftUI

struct WritingDiaryView: View {
    @State private var isPresented = true
    
    var body: some View {
        Button {
            self.isPresented.toggle()
        } label: {
            Text("WritingDiaryView")
        }
        .fullScreenCover(isPresented: $isPresented, content: CameraCoverView.init)
    }
}

struct WritingDiaryView_Previews: PreviewProvider {
    static var previews: some View {
        WritingDiaryView()
    }
}
