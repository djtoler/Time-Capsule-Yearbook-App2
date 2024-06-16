//import Foundation
//
//class UserSessionManager: ObservableObject {
//    static let shared = UserSessionManager()
//    @Published var user: User?
//
//    private init() {
//        print("Initializing UserSessionManager")
//        loadUserData()
//    }
//    
//    func printSpecificUserDefaultsKey() {
//        if let userData = UserDefaults.standard.data(forKey: "UserData") {
//            print("UserData found in UserDefaults")
//            if let userString = String(data: userData, encoding: .utf8) {
//                print(userString)
//            }
//        } else {
//            print("No UserData found in UserDefaults")
//        }
//    }
//
//    
//    func loginUser(email: String, password: String) {
//        login(email: email, password: password) { success, user in
//            DispatchQueue.main.async {
//                if success, let user = user {
//                    self.user = user
//                    self.saveUserData(user)
//                    print("Login successful, data supposed to be saved for user: \(user.email)")
//                    self.printSpecificUserDefaultsKey()
//                } else {
//                    print("Login failed or user data not valid.")
//                }
//            }
//        }
//        
//    }
//
//    private func saveUserData(_ user: User) {
//        do {
//            let userData = try JSONEncoder().encode(user)
//            UserDefaults.standard.set(userData, forKey: "UserData")
//
//            // Verify that data is actually saved
//            if let _ = UserDefaults.standard.data(forKey: "UserData") {
//                print("Verification: User data is saved in UserDefaults.")
//            } else {
//                print("Verification failed: User data is not saved.")
//            }
//        } catch {
//            print("Failed to encode user data: \(error)")
//        }
//    }
//
//
//    private func loadUserData() {
//        guard let userData = UserDefaults.standard.data(forKey: "UserData") else {
//            print("No user data found in UserDefaults")
//            return
//        }
//
//        do {
//            let user = try JSONDecoder().decode(User.self, from: userData)
//            self.user = user
//            print("Decoded user: \(user)")  // This will print the full user object
//        } catch {
//            print("Failed to decode user data: \(error)")
//        }
//    }
//
//
//    
//    func logoutUser() {
//        print("Logging out user")
//        user = nil
//        UserDefaults.standard.removeObject(forKey: "UserData")
//        print("User data removed from UserDefaults")
//    }
//}
//
