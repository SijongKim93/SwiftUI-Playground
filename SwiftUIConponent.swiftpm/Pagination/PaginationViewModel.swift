//
//  File.swift
//  
//
//  Created by SiJongKim on 1/3/25.
//

import SwiftUI

class PaginationViewModel: ObservableObject {
    @Published var items: [Item] = []
    var itemsCount: Int {
        items.count
    }
    var currentPage: Int = 1
    var isLastPage: Bool = false
    var isLoading: Bool = false
    
    @MainActor
    func getItems() async {
        guard !isLoading, !isLastPage else { return }
        
        isLoading = true
        
        let itemData = PaginationItemData.getItems(page: currentPage)
        
        if currentPage == 1 {
            self.items = itemData.items
        } else {
            self.items.append(contentsOf: itemData.items)
        }
        
        isLastPage = itemData.isLast
        currentPage += 1
        
        isLoading = false
    }
}
