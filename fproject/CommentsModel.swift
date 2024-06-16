////import Foundation
////
////class CommentsViewModel: ObservableObject {
////    @Published var comments: [Comment]
////    public var targetUser: User
////    private var currentUser: User
////    
////    init(targetUser: User, currentUser: User) {
////        self.targetUser = targetUser
////        self.currentUser = currentUser
////        self.comments = targetUser.comments ?? []
////    }
////    
////    func addComment(targetUserEmail: String, commentText: String, profilePictureURL: String, completion: @escaping (Bool) -> Void) {
////        guard let url = URL(string: "http://54.197.82.22:8000/addComment") else {
////            print("Debug: URL formation failed")
////            completion(false)
////            return
////        }
////        
////        var request = URLRequest(url: url)
////        request.httpMethod = "POST"
////        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
////        
////        let commentDetails = [
////            "targetUserEmail": targetUserEmail,
////            "comment": commentText,
////            "profilePicture": profilePictureURL  
////        ]
////        guard let jsonData = try? JSONEncoder().encode(commentDetails) else {
////            print("Debug: JSON encoding failed")
////            completion(false)
////            return
////        }
////        
////        request.httpBody = jsonData
////        
////        URLSession.shared.dataTask(with: request) { data, response, error in
////            if let error = error {
////                print("Debug: URLSession error - \(error.localizedDescription)")
////                DispatchQueue.main.async {
////                    completion(false)
////                }
////                return
////            }
////            
////            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
////                print("Debug: HTTP status code - \(httpResponse.statusCode)")
////                DispatchQueue.main.async {
////                    completion(false)
////                }
////                return
////            }
////            
////            DispatchQueue.main.async {
////                completion(true)
////            }
////        }.resume()
////    }
////}
//
//
//
//
//
////import Foundation
////
////class CommentsViewModel: ObservableObject {
////    @Published var comments: [Comment]
////    public var targetUser: User
////    public var currentUser: User
////    
////    init(targetUser: User, currentUser: User) {
////        self.targetUser = targetUser
////        self.currentUser = currentUser
////        self.comments = targetUser.comments ?? []
////    }
////    
////    func addComment(targetUserEmail: String, commentText: String, profilePictureURL: String, completion: @escaping (Bool) -> Void) {
////        guard let url = URL(string: "http://54.197.82.22:8000/addComment") else {
////            print("Debug: URL formation failed")
////            completion(false)
////            return
////        }
////        
////        var request = URLRequest(url: url)
////        request.httpMethod = "POST"
////        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
////        
////        let commentDetails = [
////            "targetUserEmail": targetUserEmail,
////            "comment": commentText,
////            "profilePicture": profilePictureURL
////        ]
////        guard let jsonData = try? JSONEncoder().encode(commentDetails) else {
////            print("Debug: JSON encoding failed")
////            completion(false)
////            return
////        }
////        
////        request.httpBody = jsonData
////        
////        URLSession.shared.dataTask(with: request) { data, response, error in
////            if let error = error {
////                print("Debug: URLSession error - \(error.localizedDescription)")
////                DispatchQueue.main.async {
////                    completion(false)
////                }
////                return
////            }
////            
////            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
////                print("Debug: HTTP status code - \(httpResponse.statusCode)")
////                DispatchQueue.main.async {
////                    completion(false)
////                }
////                return
////            }
////            
////            DispatchQueue.main.async {
////                completion(true)
////            }
////        }.resume()
////    }
////}
//
//
//
//
//import Foundation
//
//class CommentsViewModel: ObservableObject {
//    @Published var comments: [Comment]
//    public var targetUser: User
//    public var currentUser: User
//    
//    init(targetUser: User, currentUser: User) {
//        self.targetUser = targetUser
//        self.currentUser = currentUser
//        self.comments = targetUser.comments ?? []
//    }
//    
//    func addComment(targetUserEmail: String, commentText: String, profilePictureURL: String, completion: @escaping (Bool) -> Void) {
//        guard let url = URL(string: "http://54.197.82.22:8000/addComment") else {
//            print("Debug: URL formation failed")
//            completion(false)
//            return
//        }
//        
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        
//        let commentDetails = [
//            "targetUserEmail": targetUserEmail,
//            "comment": commentText,
//            "profilePicture": profilePictureURL
//        ]
//        
//        print(commentDetails, "COMMENT DETAILS")
//        
//        guard let jsonData = try? JSONEncoder().encode(commentDetails) else {
//            print("Debug: JSON encoding failed")
//            completion(false)
//            return
//        }
//        
//        request.httpBody = jsonData
//        
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let error = error {
//                print("Debug: URLSession error - \(error.localizedDescription)")
//                DispatchQueue.main.async {
//                    completion(false)
//                }
//                return
//            }
//            
//            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
//                print("Debug: HTTP status code - \(httpResponse.statusCode)")
//                DispatchQueue.main.async {
//                    completion(false)
//                }
//                return
//            }
//            
//            DispatchQueue.main.async {
//                completion(true)
//            }
//        }.resume()
//    }
//}











//import Foundation
//import Combine
//
//class CommentsViewModel: ObservableObject {
//    @Published var comments: [Comment]
//    public var targetUser: User
////    private var currentUser: User
//    public var currentUser: User
//    
//    init(targetUser: User) {
//        self.targetUser = targetUser
//        self.currentUser = LoggedInUser.shared.loggedInUserData ?? User.default // Using default user if no logged in user
//        self.comments = targetUser.comments ?? []
//    }
//    
//    func addComment(targetUserEmail: String, commentText: String, completion: @escaping (Bool) -> Void) {
//        guard let url = URL(string: "http://54.197.82.22:8000/addComment") else {
//            print("Debug: URL formation failed")
//            completion(false)
//            return
//        }
//        
//        guard let profilePictureURL = currentUser.profilePicture else {
//            print("Debug: No profile picture URL for current user")
//            completion(false)
//            return
//        }
//        
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        
//        let commentDetails = [
//            "targetUserEmail": targetUserEmail,
//            "comment": commentText,
//            "profilePicture": profilePictureURL
//        ]
//        
//        print(commentDetails, "COMMENT DETAILS")
//        
//        guard let jsonData = try? JSONEncoder().encode(commentDetails) else {
//            print("Debug: JSON encoding failed")
//            completion(false)
//            return
//        }
//        
//        request.httpBody = jsonData
//        
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let error = error {
//                print("Debug: URLSession error - \(error.localizedDescription)")
//                DispatchQueue.main.async {
//                    completion(false)
//                }
//                return
//            }
//            
//            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
//                print("Debug: HTTP status code - \(httpResponse.statusCode)")
//                DispatchQueue.main.async {
//                    completion(false)
//                }
//                return
//            }
//            
//            DispatchQueue.main.async {
//                completion(true)
//            }
//        }.resume()
//    }
//}














import Foundation
import Combine

class CommentsViewModel: ObservableObject {
    @Published var comments: [Comment]
    public var targetUser: User
    public var currentUser: User
    var commentAdded = PassthroughSubject<Void, Never>()

    init(targetUser: User) {
        self.targetUser = targetUser
        self.currentUser = LoggedInUser.shared.loggedInUserData ?? User.default // Using default user if no logged in user
        self.comments = targetUser.comments ?? []
    }
    
    func addComment(targetUserEmail: String, commentText: String, completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: "http://54.197.82.22:8000/addComment") else {
            print("Debug: URL formation failed")
            completion(false)
            return
        }
        
        guard let profilePictureURL = currentUser.profilePicture else {
            print("Debug: No profile picture URL for current user")
            completion(false)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let commentDetails = [
            "targetUserEmail": targetUserEmail,
            "comment": commentText,
            "profilePicture": profilePictureURL
        ]
        
        print(commentDetails, "COMMENT DETAILS")
        
        guard let jsonData = try? JSONEncoder().encode(commentDetails) else {
            print("Debug: JSON encoding failed")
            completion(false)
            return
        }
        
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Debug: URLSession error - \(error.localizedDescription)")
                DispatchQueue.main.async {
                    completion(false)
                }
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                print("Debug: HTTP status code - \(httpResponse.statusCode)")
                DispatchQueue.main.async {
                    completion(false)
                }
                return
            }
            
            DispatchQueue.main.async {
                self.commentAdded.send()
                completion(true)
            }
        }.resume()
    }

    func fetchUserComments() {
        guard let url = URL(string: "http://54.197.82.22:8000/users/\(targetUser.email)/comments") else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let comments = try JSONDecoder().decode([Comment].self, from: data)
                    DispatchQueue.main.async {
                        self.comments = comments
                    }
                } catch {
                    print("Failed to decode comments: \(error)")
                }
            }
        }.resume()
    }
}
