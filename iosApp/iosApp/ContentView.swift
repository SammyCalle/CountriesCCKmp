import SwiftUI
import Shared

struct ContentView: View {
    var body: some View {
        AppNavigationStack()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(countryCode: "DE")
            .environmentObject(MockDetailObserver(countryCode: "DE"))
            .previewDevice("iPhone 14")
            .previewDisplayName("iPhone 14 Preview")
            .preferredColorScheme(.light)
        
        DetailView(countryCode: "DE")
            .environmentObject(MockDetailObserver(countryCode: "DE"))
            .previewDevice("iPhone 14")
            .previewDisplayName("iPhone 14 Preview")
            .preferredColorScheme(.dark)
    }
}

struct SearchView_Previews: PreviewProvider {
    @State static var path = NavigationPath()
    
    static var previews: some View {
        NavigationStack(path: $path) {
            SearchView(path: $path)
                .environmentObject(MockSearchObserver())
                .previewDevice("iPhone 14")
                .previewDisplayName("iPhone 14 Preview")
                .preferredColorScheme(.light)
        }
    }
}
