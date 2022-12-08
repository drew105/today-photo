//
//  CameraCoverView.swift
//  today-photo
//
//  Created by 김동윤 on 2022/11/29.
//

import SwiftUI

struct CameraCoverView: View {
    var body: some View {
        CameraView()
            .edgesIgnoringSafeArea(.all)
    }
}

struct CameraCoverView_Previews: PreviewProvider {
    static var previews: some View {
        CameraCoverView()
    }
}
