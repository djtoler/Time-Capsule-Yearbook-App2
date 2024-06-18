//import SwiftUI
//
//struct Verification: View {
//    @State private var user: User?
//
//    var body: some View {
//        VStack {
//            if let user = user {
//                Text("Logged-in User: \(user.firstName) \(user.lastName)")
//                    .padding()
//                Text("Email: \(user.email)")
//                    .padding()
//                // Add more fields as needed
//            } else {
//                Text("Who's currently logged in?")
//                    .padding()
//            }
//            Button("Check User") {
//                if let loadedUser = User.load() {
//                    print("User loaded successfully: \(loadedUser.email)")
//                    self.user = loadedUser
//                } else {
//                    print("No user data found in UserDefaults.")
//                    self.user = nil // Ensures the UI updates to show no user is logged in
//                }
//            }
//            .foregroundColor(.white)
//            .padding()
//            .background(Color.blue)
//            .cornerRadius(10)
//        }
//        .padding()
//        .onAppear {
//            if let loadedUser = User.load() {
//                print("User loaded on view appearance: \(loadedUser.email)")
//                self.user = loadedUser
//            } else {
//                print("No user data found in UserDefaults on view appearance.")
//                self.user = nil // Ensures the UI updates to show no user is logged in
//            }
//        }
//    }
//}
//
//struct VerificationView_Previews: PreviewProvider {
//    static var previews: some View {
//        Verification()
//    }
//}
//





//import SwiftUI
//
//struct Verification: View {
//    @State private var user: User?
//
//    var body: some View {
//        VStack {
//            if let user = user {
//                Text("Logged-in User: \(user.firstName) \(user.lastName)")
//                    .padding()
//                Text("Email: \(user.email)")
//                    .padding()
//                // Add more fields as needed
//            } else {
//                Text("Who's currently logged in?")
//                    .padding()
//            }
//
//            Button("Check User") {
//                if let loadedUser = User.load() {
//                    print("User loaded successfully: \(loadedUser.email)")
//                    self.user = loadedUser
//                } else {
//                    print("No user data found in UserDefaults.")
//                    self.user = nil // Ensures the UI updates to show no user is logged in
//                }
//            }
//            .foregroundColor(.white)
//            .padding()
//            .background(Color.blue)
//            .cornerRadius(10)
//
//            Button("Log Out") {
//                UserDefaults.standard.removeObject(forKey: "user")
//                print("User logged out.")
//                self.user = nil // Ensures the UI updates to show no user is logged in
//            }
//            .foregroundColor(.white)
//            .padding()
//            .background(Color.red)
//            .cornerRadius(10)
//        }
//        .padding()
//        .onAppear {
//            if let loadedUser = User.load() {
//                print("User loaded on view appearance: \(loadedUser.email)")
//                self.user = loadedUser
//            } else {
//                print("No user data found in UserDefaults on view appearance.")
//                self.user = nil // Ensures the UI updates to show no user is logged in
//            }
//        }
//    }
//}
//
//struct VerificationView_Previews: PreviewProvider {
//    static var previews: some View {
//        Verification()
//    }
//}






import SwiftUI


struct Verification: View {
    @StateObject private var loggedInUser = LoggedInUser.shared
    
    var body: some View {
        VStack {
            if let user = loggedInUser.loggedInUserData {
                Text("Logged-in User: \(user.firstName) \(user.lastName)")
                    .padding()
                Text("Email: \(user.email)")
                    .padding()
                // Add more fields as needed
            } else {
                Text("Who's currently logged in?")
                    .padding()
            }

            Button("Check User") {
                if let loadedUser = User.load() {
                    print("User loaded successfully: \(loadedUser.email)")
                    loggedInUser.loggedInUserData = loadedUser
                } else {
                    print("No user data found in UserDefaults.")
                    loggedInUser.loggedInUserData = nil // Ensures the UI updates to show no user is logged in
                }
            }
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .cornerRadius(10)

            Button("Log Out") {
                UserDefaults.standard.removeObject(forKey: "user")
                print("User logged out.")
                loggedInUser.loggedInUserData = nil // Ensures the UI updates to show no user is logged in
            }
            .foregroundColor(.white)
            .padding()
            .background(Color.red)
            .cornerRadius(10)

            Button("Print All UserDefaults Data") {
                let defaults = UserDefaults.standard
                let dictionary = defaults.dictionaryRepresentation()
                for (key, value) in dictionary {
                    if key == "CurrentUser" || key == "user" {
                        if let data = value as? Data {
                            let decoder = JSONDecoder()
                            do {
                                let user = try decoder.decode(User.self, from: data)
                                print("Decoded \(key): \(user)")
                            } catch {
                                print("Failed to decode \(key): \(error)")
                            }
                        } else {
                            print("\(key): \(value)")
                        }
                    } else {
                        print("\(key): \(value)")
                    }
                }
            }
            .foregroundColor(.white)
            .padding()
            .background(Color.green)
            .cornerRadius(10)
        }
        .padding()
        .onAppear {
            if let loadedUser = User.load() {
                print("User loaded on view appearance: \(loadedUser.email)")
                loggedInUser.loggedInUserData = loadedUser
            } else {
                print("No user data found in UserDefaults on view appearance.")
                loggedInUser.loggedInUserData = nil // Ensures the UI updates to show no user is logged in
            }
        }
    }
}

struct VerificationView_Previews: PreviewProvider {
    static var previews: some View {
        Verification()
    }
}














//import SwiftUI
//
//struct Verification: View {
//    @State private var user: User?
//
//    var body: some View {
//        VStack {
//            if let user = user {
//                Text("Logged-in User: \(user.firstName) \(user.lastName)")
//                    .padding()
//                Text("Email: \(user.email)")
//                    .padding()
//                // Add more fields as needed
//            } else {
//                Text("Who's currently logged in?")
//                    .padding()
//            }
//            Button("Check User") {
//                self.user = User.load() // Attempt to load user data
//            }
//            .foregroundColor(.white)
//            .padding()
//            .background(Color.blue)
//            .cornerRadius(10)
//        }
//        .padding()
//        .onAppear {
//            self.user = User.load() // Load user data when the view appears
//        }
//    }
//}
//
//struct VerificationView_Previews: PreviewProvider {
//    static var previews: some View {
//        Verification()
//    }
//}
//
//








//import SwiftUI
//
//struct Verification: View {
//    @State private var user: User? = nil
//
//    var body: some View {
//        
//        VStack {
//            if let user = user {
//                Text("Logged-in User: \(user.firstName) \(user.lastName)")
//                    .padding()
//                Text("Email: \(user.email)")
//                    .padding()
//                // Add more fields as needed
//            } else {
//                Text("Whos currently logged in?")
//                    .padding()
//            }
//            Button("Check User") {
//                self.user = User.load()
//            }
//            .foregroundColor(.white)
//            .padding()
//            .background(Color.blue)
//            .cornerRadius(10)
//        }
//        .padding()
//    }
//}
//
//struct VarificationView_Previews: PreviewProvider {
//    static var previews: some View {
//        Verification()
//    }
//}
//
