//
//  File.swift
//  
//
//  Created by SiJongKim on 1/3/25.
//

import Foundation

struct Item {
    let title: String
    let description: String
}

struct PaginationItemData {
    let page: Int
    let isLast: Bool
    let items: [Item]
}

extension PaginationItemData {
    static let stub1: PaginationItemData = .init(
        page: 1,
        isLast: false,
        items: [
            .init(title: "1번 타이틀", description: "1번 설명"),
            .init(title: "2번 타이틀", description: "2번 설명"),
            .init(title: "3번 타이틀", description: "3번 설명"),
            .init(title: "4번 타이틀", description: "4번 설명"),
            .init(title: "5번 타이틀", description: "5번 설명"),
            .init(title: "6번 타이틀", description: "6번 설명"),
            .init(title: "7번 타이틀", description: "7번 설명"),
            .init(title: "8번 타이틀", description: "8번 설명"),
            .init(title: "9번 타이틀", description: "9번 설명"),
            .init(title: "10번 타이틀", description: "10번 설명")
        ]
    )
    
    static let stub2: PaginationItemData = .init(
        page: 2,
        isLast: false,
        items: [
            .init(title: "11번 타이틀", description: "11번 설명"),
            .init(title: "12번 타이틀", description: "12번 설명"),
            .init(title: "13번 타이틀", description: "13번 설명"),
            .init(title: "14번 타이틀", description: "14번 설명"),
            .init(title: "15번 타이틀", description: "15번 설명"),
            .init(title: "16번 타이틀", description: "16번 설명"),
            .init(title: "17번 타이틀", description: "17번 설명")
        ]
    )
    
    static let stub3: PaginationItemData = .init(
        page: 3,
        isLast: true,
        items: [
            .init(title: "18번 타이틀", description: "18번 설명"),
            .init(title: "19번 타이틀", description: "19번 설명"),
            .init(title: "20번 타이틀", description: "20번 설명"),
            .init(title: "21번 타이틀", description: "21번 설명"),
            .init(title: "22번 타이틀", description: "22번 설명"),
            .init(title: "23번 타이틀", description: "23번 설명"),
            .init(title: "24번 타이틀", description: "24번 설명")
        ]
    )
    
    static func getItems(page: Int) -> PaginationItemData {
        if page == 1 {
            return PaginationItemData.stub1
        } else if page == 2 {
            return PaginationItemData.stub2
        } else {
            return PaginationItemData.stub3
        }
    }
}
