import SwiftUI

struct TabView2: View {
    @State private var user: User = User.load() ?? User.default

    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.black
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
        UITabBar.appearance().tintColor = .bay
        
        UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor: UIColor.bay], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor: UIColor.bay], for: .selected)
    }

    var body: some View {
        TabView {
            Headshots()
                .tabItem {
                    Label("Yearbook", systemImage: "book")
                }
            sup()
                .tabItem {
                    Label("Awards", systemImage: "trophy")
                }

            UserProfileView(user: user)
                .tabItem {
                    Label("Profile", systemImage: "person")
                }

            NotificationsView(user: user)
                .tabItem {
                    Label("Notifications", systemImage: "bell")
                }

            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
        }
    }
}

struct Tab_Previews: PreviewProvider {
    static var previews: some View {
        TabView2()
    }
}
