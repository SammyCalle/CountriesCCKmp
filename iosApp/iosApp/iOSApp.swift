import SwiftUI
import Shared

@main
struct iOSApp: App {
    init () {
        KoinInitKt.doInitKoin(config: nil)
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
