import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            CategoryView(regions: sampleRegions)
        }
    }
}

let sampleRegions: [Region] = [
    Region(name: "서울", districts: [
        District(name: "강남구"),
        District(name: "서초구"),
        District(name: "종로구"),
        District(name: "송파구"),
        District(name: "마포구")
    ]),
    Region(name: "부산", districts: [
        District(name: "해운대구"),
        District(name: "수영구"),
        District(name: "남구"),
        District(name: "중구")
    ]),
    Region(name: "대구", districts: [
        District(name: "중구"),
        District(name: "동구"),
        District(name: "서구"),
        District(name: "수성구")
    ]),
    Region(name: "광주", districts: [
        District(name: "동구"),
        District(name: "서구"),
        District(name: "남구"),
        District(name: "북구")
    ]),
    Region(name: "대전", districts: [
        District(name: "유성구"),
        District(name: "중구"),
        District(name: "서구"),
        District(name: "대덕구")
    ])
]
