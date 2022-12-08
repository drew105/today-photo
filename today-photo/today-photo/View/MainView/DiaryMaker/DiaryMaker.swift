//
//  DiaryMaker.swift
//  today-photo
//
//  Created by daseul on 2022/12/05.
//

import Foundation

struct DiaryMaker {
    let title: String
    let imageUrl: String
    let location: String
    let song: String
    let diaryDate: String
    let diaryDay: String
}

extension DiaryMaker {
  //일기 데이터 연동필요
    static func all() -> [DiaryMaker] {
        return [
            DiaryMaker(title: "일기 1", imageUrl: "image1", location: "location 1", song: "song", diaryDate:"03", diaryDay:"Mon"),
            DiaryMaker(title: "일기 2", imageUrl: "image2", location: "location 2", song: "song", diaryDate:"03", diaryDay:"Tue"),
            DiaryMaker(title: "일기 3", imageUrl: "image3", location: "location 3", song: "song", diaryDate:"03", diaryDay:"Wed"),
            DiaryMaker(title: "일기 4", imageUrl: "image3", location: "location 3", song: "song", diaryDate:"03", diaryDay:"Thu"),
            DiaryMaker(title: "일기 5", imageUrl: "image3", location: "location 3", song: "song", diaryDate:"03", diaryDay:"Fri"),
        ]
    }
}
