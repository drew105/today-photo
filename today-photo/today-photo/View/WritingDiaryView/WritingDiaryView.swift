//
//  WritingDiaryView.swift
//  today-photo
//
//  Created by 김동윤 on 2022/11/15.
//

import SwiftUI

struct WritingDiaryView: View {
    var body: some View {
        CameraView()
            .navigationBarBackButtonHidden()
            .edgesIgnoringSafeArea(.all)
    }
}

struct WritingDiaryView_Previews: PreviewProvider {
    static var previews: some View {
        WritingDiaryView()
    }
}
