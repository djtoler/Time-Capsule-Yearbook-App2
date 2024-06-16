import Foundation

extension User {
    //    func save() {
    //        let encoder = JSONEncoder()
    //        if let encoded = try? encoder.encode(self) {
    //            UserDefaults.standard.set(encoded, forKey: "CurrentUser")
    //        }
    //    }
    //
    //    static func load() -> User? {
    //        if let savedUserData = UserDefaults.standard.object(forKey: "CurrentUser") as? Data {
    //            let decoder = JSONDecoder()
    //            if let loadedUser = try? decoder.decode(User.self, from: savedUserData) {
    //                return loadedUser
    //            }
    //        }
    //        return nil
    //    }
    
    // Save the user to UserDefaults
    func save() {
        if let encoded = try? JSONEncoder().encode(self) {
            UserDefaults.standard.set(encoded, forKey: "user")
        }
    }
    
    // Load the user from UserDefaults
    static func load() -> User? {
        if let savedUserData = UserDefaults.standard.data(forKey: "user"),
           let decodedUser = try? JSONDecoder().decode(User.self, from: savedUserData) {
            return decodedUser
        }
        return nil
    }
    
    
//    static func loadFromUserDefaults() -> User? {
//        let defaults = UserDefaults.standard
//        if let userData = defaults.data(forKey: "currentUser") {
//            let decoder = JSONDecoder()
//            do {
//                let user = try decoder.decode(User.self, from: userData)
//                print("Decoded user from UserDefaults: \(user.email)")
//                return user
//            } catch {
//                print("Failed to decode user: \(error)")
//            }
//        } else {
//            print("No user data found in UserDefaults for key 'currentUser'.")
//        }
//        return nil
//    }
    
//    static let userDefaultsKey = "currentUser"
//
//       static func loadFromUserDefaults() -> User? {
//           guard let data = UserDefaults.standard.data(forKey: userDefaultsKey) else {
//               return nil
//           }
//           do {
//               let decoder = JSONDecoder()
//               let user = try decoder.decode(User.self, from: data)
//               return user
//           } catch {
//               print("Error decoding user data: \(error.localizedDescription)")
//               return nil
//           }
//       }

//       func saveToUserDefaults() {
//           do {
//               let encoder = JSONEncoder()
//               let data = try encoder.encode(self)
//               UserDefaults.standard.set(data, forKey: User.userDefaultsKey)
//           } catch {
//               print("Error encoding user data: \(error.localizedDescription)")
//           }
//       }
}

