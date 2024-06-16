
import SwiftUI

struct ContentView: View {
    @StateObject private var loggedInUser = LoggedInUser.shared
    
    var body: some View {
        VStack {
//            if let user = loggedInUser.loggedInUserData {
//                Text("Logged-in User: \(user.firstName) \(user.lastName)")
//                  
//                Text("Email: \(user.email)")
//                    .padding()
//                // Add more fields as needed
//            } else {
//                Text("Who's currently logged in?")
//                    .padding()
//            }
            
//            TabView2()
            LoginView()
            
        }
        .onAppear {
            if let loadedUser = User.load() {
                print("User loaded on view appearance: \(loadedUser.email)")
                print("User image loaded on view appearance: \(loadedUser.profilePicture)")
                loggedInUser.loggedInUserData = loadedUser
            } else {
                print("No user data found in UserDefaults on view appearance.")
                loggedInUser.loggedInUserData = nil // Ensures the UI updates to show no user is logged in
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}















//import SwiftUI
//
//struct ContentView: View {
//    var body: some View {
//        TabView2()
//    }
//    
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}










//struct ContentView: View {
//    @EnvironmentObject var sessionManager: UserSessionManager
//
//    var body: some View {
//        VStack {
//            if let user = sessionManager.user {
//                Text("Logged in as \(user.email)")
//            } else {
//                Text("Not logged in")
//            }
//        }
//    }
//}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
////        Group {
////            ContentView()
////                .environmentObject(UserSessionManager.previewLoggedIn())
////                .previewDisplayName("User Logged In")
////
////            ContentView()
////                .environmentObject(UserSessionManager.previewLoggedOut())
////                .previewDisplayName("User Not Logged In")
////        }
//    }
//}







//
//  ContentView.swift
//  fproject
//
//  Created by Dwayne Toler on 5/13/24.
//

//import SwiftUI
//
//struct ContentView: View {
//    @EnvironmentObject var sessionManager: UserSessionManager
//
//    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .padding()
//    }
//}
//
//#Preview {
//    ContentView()
//}
