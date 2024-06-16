import SwiftUI
import Combine

class LoggedInUser: ObservableObject {
    static let shared = LoggedInUser()
    
    @Published var loggedInUserData: User? {
        didSet {
            if let user = loggedInUserData {
                saveUserToUserDefaults(user)
                printUserDetails(user)
            } else {
                removeUserFromUserDefaults()
            }
        }
    }
    
    private init() {
        self.loggedInUserData = loadUserFromUserDefaults()
    }
    
    private func saveUserToUserDefaults(_ user: User) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(user) {
            UserDefaults.standard.set(encoded, forKey: "loggedInUser")
        }
    }
    
    private func loadUserFromUserDefaults() -> User? {
        if let savedUser = UserDefaults.standard.object(forKey: "loggedInUser") as? Data {
            let decoder = JSONDecoder()
            if let loadedUser = try? decoder.decode(User.self, from: savedUser) {
//                print("User loaded from UserDefaults: \(loadedUser)")
                return loadedUser
            }
        }
        return nil
    }
    
    private func removeUserFromUserDefaults() {
        UserDefaults.standard.removeObject(forKey: "loggedInUser")
    }
    
    private func printUserDetails(_ user: User) {
        print("User Details - First Name: \(user.firstName), Last Name: \(user.lastName), Email: \(user.email)")
    }
}

