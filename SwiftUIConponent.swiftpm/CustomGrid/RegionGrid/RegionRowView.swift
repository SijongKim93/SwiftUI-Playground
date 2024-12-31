//
//  File.swift
//  
//
//  Created by SiJongKim on 12/30/24.
//

import SwiftUI

struct RegionRowView: View {
    let regions: [Region]
    let expandedRegion: String?
    let onRegionTap: (String) -> Void
    let selectedSubRegion: [String: [String]]
    let onSubRegionTap: (District, Region) -> Void
    let gridColumns = Array(repeating: GridItem(.flexible(), spacing: 8), count: 4)
    
    var body: some View {
        VStack(spacing: 0) {
            LazyVGrid(columns: gridColumns, alignment: .leading, spacing: 8) {
                ForEach(regions) { region in
                    regionButton(for: region)
                }
                ForEach(0..<(4 - regions.count), id: \.self) { _ in
                    Color.clear
                        .frame(height: 44)
                }
            }
            .padding(.horizontal)
            
            if let seletedRegion = regions.first(where: { $0.name == expandedRegion }) {
                districtsGrid(for: seletedRegion)
            }
        }
    }
    
    @ViewBuilder
    private func regionButton(for region: Region) -> some View {
        Button(action: {
            onRegionTap(region.name)
        }, label: {
            Text(region.name)
                .font(.body)
                .frame(maxWidth: .infinity)
                .frame(height: 44)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.gray.opacity(0.1))
                )
                .opacity(expandedRegion == region.name ? 0 : 1)
                .overlay(
                    Text(region.name)
                        .font(.body)
                        .bold()
                        .frame(maxWidth: .infinity)
                        .frame(height: 44)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.green.opacity(0.1))
                        )
                        .opacity(expandedRegion == region.name ? 1 : 0)
                )
        })
        .buttonStyle(PlainButtonStyle())
    }
    
    @ViewBuilder
    private func districtsGrid(for region: Region) -> some View {
        LazyVGrid(columns: gridColumns, spacing: 8) {
            ForEach(region.districts) { district in
                Button(action: {
                    onSubRegionTap(district, region)
                }, label: {
                    Text(district.name)
                        .frame(maxWidth: .infinity)
                        .frame(height: 44)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(
                                    selectedSubRegion[region.name]?.contains(district.name) ?? false
                                    ? Color.blue.opacity(0.1)
                                    : Color.gray.opacity(0.3)
                                )
                        )
                })
                .buttonStyle(PlainButtonStyle())
            }
        }
        .padding(.horizontal)
        .padding(.top, 16)
        .transition(.opacity)
    }
}
