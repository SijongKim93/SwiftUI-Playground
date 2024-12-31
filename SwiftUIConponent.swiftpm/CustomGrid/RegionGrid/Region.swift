//
//  File.swift
//  
//
//  Created by SiJongKim on 12/30/24.
//

import Foundation

struct Region: Identifiable {
    let id = UUID()
    let name: String
    let districts: [District]
}

struct District: Identifiable {
    let id = UUID()
    let name: String
}

