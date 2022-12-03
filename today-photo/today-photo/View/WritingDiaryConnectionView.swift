//
//  WritingDiaryConnectionView.swift
//  today-photo
//
//  Created by 김동윤 on 2022/12/04.
//

import SwiftUI

struct WritingDiaryConnectionView: View {
    var body: some View {
        NavigationView {
            NavigationLink("WritingDiaryView") {
                WritingDiaryView()
            }
        }
    }
}

struct WritingDiaryConnectionView_Previews: PreviewProvider {
    static var previews: some View {
        WritingDiaryConnectionView()
    }
}
