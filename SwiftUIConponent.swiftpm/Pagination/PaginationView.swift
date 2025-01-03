//
//  File.swift
//
//
//  Created by SiJongKim on 1/3/25.
//

import SwiftUI

struct PaginationView: View {
    @StateObject private var viewModel = PaginationViewModel()
    
    var body: some View {
        VStack(spacing: 10) {
            Text("\(viewModel.itemsCount)")
                .font(.headline)
            
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(0..<(viewModel.items.count), id: \.self) { index in
                        HStack(spacing: 0) {
                            VStack(alignment: .leading, spacing: 10) {
                                Text(viewModel.items[index].title)
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                    .padding()
                                    .background(Color.gray.opacity(0.1))
                                    .cornerRadius(10)
                                
                                Text(viewModel.items[index].description)
                                    .font(.body)
                                    .foregroundColor(.secondary)
                                
                                Rectangle()
                                    .fill(.gray)
                                    .frame(height: 1)
                                    .padding(.horizontal, 5)
                            }
                            
                            Spacer()
                        }
                        .onAppear {
                            guard index == viewModel.items.count - 1 else {
                                return
                            }
                            
                            Task {
                                await viewModel.getItems()
                            }
                        }
                    }
                }
            }
            .padding()
            .onAppear {
                Task {
                    await viewModel.getItems()
                }
            }
        }
    }
}
