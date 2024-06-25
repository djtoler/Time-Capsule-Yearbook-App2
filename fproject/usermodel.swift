import SwiftUI
import Foundation

struct LoginResponse: Codable {
    var message: String
    var user: User
    var token: String
}


struct SignupResponse: Codable {
    let success: Bool
    let message: String
    let user: User?
    
    enum CodingKeys: String, CodingKey {
        case success, message, user = "newUser"
    }
}


//struct Comment: Codable, Identifiable, Hashable {
//    var id: String { comment }
//    var comment: String
//    var profilePicture: String
//}
//
//
//struct User: Codable, Identifiable {
//    var id: String { email }
//    var email: String
//    var firstName: String
//    var lastName: String
//    var specialty: String
//    var accessCode: String?
//    var image01: String?
//    var image02: String?
//    var image03: String?
//    var image04: String?
//    var image05: String?
//    var image06: String?
//    var image07: String?
//    var image08: String?
//    var profilePicture: String?
//    var link01: String?
//    var link02: String?
//    var comments: [Comment]?

struct Comment: Codable, Identifiable, Hashable {
    var id: String { comment }
    var comment: String
    var profilePicture: String
}

struct User: Codable, Identifiable, Hashable {
    var id: String { email }
    var email: String
    var firstName: String
    var lastName: String
    var specialty: String
    var accessCode: String?
    var image01: String?
    var image02: String?
    var image03: String?
    var image04: String?
    var image05: String?
    var image06: String?
    var image07: String?
    var image08: String?
    var profilePicture: String?
    var link01: String?
    var link02: String?
    var comments: [Comment]?



    static var `default`: User {
        return User(email: "default@example.com", firstName: "John", lastName: "Doe", specialty: "General", accessCode: "XYZ123", comments: [])
    }

    static let userDefaultsKey = "currentUser"

    static func loadFromUserDefaults() -> User? {
        guard let data = UserDefaults.standard.data(forKey: userDefaultsKey) else {
            print("No user data found in UserDefaults.")
            return nil
        }
        do {
            let decoder = JSONDecoder()
            let user = try decoder.decode(User.self, from: data)
            print("Decoded user from UserDefaults: \(user)")
            return user
        } catch {
            print("Error decoding user data: \(error.localizedDescription)")
            return nil
        }
    }

    func saveToUserDefaults() {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(self)
            UserDefaults.standard.set(data, forKey: User.userDefaultsKey)
            print("Saved user to UserDefaults: \(self)")
        } catch {
            print("Error encoding user data: \(error.localizedDescription)")
        }
    }
}





