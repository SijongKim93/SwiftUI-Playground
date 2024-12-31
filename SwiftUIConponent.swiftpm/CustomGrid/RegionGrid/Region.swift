//
//  File.swift
//  
//
//  Created by SiJongKim on 12/30/24.
//

import Foundation

struct Region: Identifiable, Hashable {
    let id = UUID()
    let name: String
    var districts: [District]
    
    static func == (lhs: Region, rhs: Region) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct District: Identifiable {
    let id = UUID()
    let name: String
}

