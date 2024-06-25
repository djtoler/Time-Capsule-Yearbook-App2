//import SwiftUI
//
//struct BasicTabBarView: View {
//    var body: some View {
//        Text("duegdueywdgy")
//    }
//}
//
//struct BasicTabBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        BasicTabBarView()
//    }
//}
//




import SwiftUI



//struct TabView2: View {
//    @State private var user: User = User.load() ?? User.default
//    var body: some View {
//        TabView {
//            Headshots()
//                .tabItem {
//                    Label("Yearbook", systemImage: "book")
//                }
//            sup()
//                .tabItem {
//                    Label("Awards", systemImage: "trophy")
//                }
//
//            UserProfileView(user: user)
//                .tabItem {
//                    Label("Profile", systemImage: "person")
//                }
//
//            NotificationsView(user: user)
//                .tabItem {
//                    Label("Notifications", systemImage: "bell")
//                }
//
//            SearchView()
//                .tabItem {
//                    Label("Search", systemImage: "magnifyingglass")
//                }
//        }
//        .foregroundStyle(.ultraThinMaterial)
//    }
//}
//
//struct Tab_Previews: PreviewProvider {
//    static var previews: some View {
//        TabView2()
//    }
//}


import SwiftUI

struct TabView2: View {
    @State private var user: User = User.load() ?? User.default

    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = UIColor.gray.withAlphaComponent(0.3)
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
        UITabBar.appearance().tintColor = .white // Set the icon color when selected to white
        
        UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
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
        .foregroundStyle(.ultraThinMaterial)
    }
}

struct Tab_Previews: PreviewProvider {
    static var previews: some View {
        TabView2()
    }
}


