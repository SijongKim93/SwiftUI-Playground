//
//  File.swift
//
//
//  Created by SiJongKim on 12/31/24.
//

import SwiftUI

struct CategoryView: View {
    @State private var expandedRegion: String? = nil
    @State private var selectedSubRegion: [String: [String]] = [:]
    let regions: [Region]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(chunks(of: regions, chunkSize: 4), id: \.self) { chunk in
                    RegionRowView(
                        regions: chunk,
                        expandedRegion: expandedRegion,
                        onRegionTap: { regionName in
                            withAnimation {
                                expandedRegion = (expandedRegion == regionName) ? nil : regionName
                            }
                        },
                        selectedSubRegion: selectedSubRegion,
                        onSubRegionTap: { district, region in
                            if selectedSubRegion[region.name]?.contains(district.name) == true {
                                selectedSubRegion[region.name]?.removeAll { $0 == district.name }
                            } else {
                                selectedSubRegion[region.name, default: []].append(district.name)
                            }
                        }
                    )
                }
            }
            .padding()
        }
    }
    
    private func chunks(of regions: [Region], chunkSize: Int) -> [[Region]] {
        stride(from: 0, to: regions.count, by: chunkSize).map {
            Array(regions[$0..<min($0 + chunkSize, regions.count)])
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(regions: sampleRegions)
    }

    static var sampleRegions: [Region] = [
        Region(name: "서울", districts: [District(name: "강남구"), District(name: "서초구")]),
        Region(name: "부산", districts: [District(name: "해운대구"), District(name: "수영구")]),
        // 추가 샘플 데이터...
    ]
}
