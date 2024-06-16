import Foundation

func login(email: String, password: String, completion: @escaping (Bool, User?) -> Void) {
    guard let url = URL(string: "http://54.197.82.22:8000/login") else {
        print("Debug: URL formation failed")
        completion(false, nil)
        return
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
    let loginDetails = ["email": email, "password": password]
    guard let jsonData = try? JSONEncoder().encode(loginDetails) else {
        print("Debug: JSON encoding failed")
        completion(false, nil)
        return
    }
    
    request.httpBody = jsonData
    
    URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            print("Debug: URLSession error - \(error.localizedDescription)")
            DispatchQueue.main.async {
                completion(false, nil)
            }
            return
        }
        
        if let httpResponse = response as? HTTPURLResponse {
            print("Debug: HTTP status code - \(httpResponse.statusCode)")
            if httpResponse.statusCode != 200 {
                print("Debug: Server response code not 200 - actual code: \(httpResponse.statusCode)")
                DispatchQueue.main.async {
                    completion(false, nil)
                }
                return
            }
        }
        
        guard let data = data, !data.isEmpty else {
            print("Debug: No data received or data is empty")
            DispatchQueue.main.async {
                completion(false, nil)
            }
            return
        }

        // Optional: Print raw JSON data
        if let rawJSON = String(data: data, encoding: .utf8) {
            print("Debug: Raw JSON data - \(rawJSON)")
        }

        do {
            let response = try JSONDecoder().decode(LoginResponse.self, from: data)
            UserDefaults.standard.set(response.token, forKey: "authToken")  // Save token to UserDefaults
            
            // Save the complete user object
            response.user.save()
            
            DispatchQueue.main.async {
                print("Debug: Login successful for user \(response.user.email)")
                print("Debug: Token and user data saved to UserDefaults")
                completion(true, response.user)
            }
        } catch {
            print("Debug: JSON decoding failed - \(error.localizedDescription)")
            DispatchQueue.main.async {
                completion(false, nil)
            }
        }
    }.resume()
}























//import Foundation
//
//
//func login(email: String, password: String, completion: @escaping (Bool, User?) -> Void) {
//    guard let url = URL(string: "http://18.234.107.225:8000/login") else {
//        print("Debug: URL formation failed")
//        completion(false, nil)
//        return
//    }
//    
//    var request = URLRequest(url: url)
//    request.httpMethod = "POST"
//    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//    
//    let loginDetails = ["email": email, "password": password]
//    guard let jsonData = try? JSONEncoder().encode(loginDetails) else {
//        print("Debug: JSON encoding failed")
//        completion(false, nil)
//        return
//    }
//    
//    request.httpBody = jsonData
//    
//    URLSession.shared.dataTask(with: request) { data, response, error in
//        if let error = error {
//            print("Debug: URLSession error - \(error.localizedDescription)")
//            DispatchQueue.main.async {
//                completion(false, nil)
//            }
//            return
//        }
//        
//        if let httpResponse = response as? HTTPURLResponse {
//            print("Debug: HTTP status code - \(httpResponse.statusCode)")
//            if httpResponse.statusCode != 200 {
//                print("Debug: Server response code not 200 - actual code: \(httpResponse.statusCode)")
//                DispatchQueue.main.async {
//                    completion(false, nil)
//                }
//                return
//            }
//        }
//        
//        guard let data = data, !data.isEmpty else {
//            print("Debug: No data received or data is empty")
//            DispatchQueue.main.async {
//                completion(false, nil)
//            }
//            return
//        }
//
//        // Optional: Print raw JSON data
//        if let rawJSON = String(data: data, encoding: .utf8) {
//            print("Debug: Raw JSON data - \(rawJSON)")
//        }
//
//        do {
//            let response = try JSONDecoder().decode(LoginResponse.self, from: data)
//            UserDefaults.standard.set(response.token, forKey: "authToken")  // Save token to UserDefaults
//            DispatchQueue.main.async {
//                print("Debug: Login successful for user \(response.user.email)")
//                print("Debug: Token saved to UserDefaults")
//                completion(true, response.user)
//            }
//        } catch {
//            print("Debug: JSON decoding failed - \(error.localizedDescription)")
//            DispatchQueue.main.async {
//                completion(false, nil)
//            }
//        }
//    }.resume()
//}



















//import Foundation
//
//func login(email: String, password: String, completion: @escaping (Bool, User?) -> Void) {
//    guard let url = URL(string: "http://18.234.107.225:8000/login") else {
//        print("Debug: URL formation failed")
//        completion(false, nil)
//        return
//    }
//    
//    var request = URLRequest(url: url)
//    request.httpMethod = "POST"
//    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//    
//    let loginDetails = ["email": email, "password": password]
//    guard let jsonData = try? JSONEncoder().encode(loginDetails) else {
//        print("Debug: JSON encoding failed")
//        completion(false, nil)
//        return
//    }
//    
//    request.httpBody = jsonData
//    
//    URLSession.shared.dataTask(with: request) { data, response, error in
//        if let error = error {
//            print("Debug: URLSession error - \(error.localizedDescription)")
//            DispatchQueue.main.async {
//                completion(false, nil)
//            }
//            return
//        }
//        
//        if let httpResponse = response as? HTTPURLResponse {
//            print("Debug: HTTP status code - \(httpResponse.statusCode)")
//            if httpResponse.statusCode != 200 {
//                print("Debug: Server response code not 200 - actual code: \(httpResponse.statusCode)")
//                DispatchQueue.main.async {
//                    completion(false, nil)
//                }
//                return
//            }
//        }
//        
//        guard let data = data, !data.isEmpty else {
//            print("Debug: No data received or data is empty")
//            DispatchQueue.main.async {
//                completion(false, nil)
//            }
//            return
//        }
//
//        // Optional: Print raw JSON data
//        if let rawJSON = String(data: data, encoding: .utf8) {
//            print("Debug: Raw JSON data - \(rawJSON)")
//        }
//
//        do {
//            let response = try JSONDecoder().decode(LoginResponse.self, from: data)
//            DispatchQueue.main.async {
//                print("Debug: Login successful for user \(response.user.email)")
//                completion(true, response.user)
//            }
//        } catch {
//            print("Debug: JSON decoding failed - \(error.localizedDescription)")
//            DispatchQueue.main.async {
//                completion(false, nil)
//            }
//        }
//    }.resume()
//
//}



//import Foundation
//
//struct LoginResponse: Codable {
//    let message: String
//    let token: String
//    let user: User
//}
//
//func login(email: String, password: String, completion: @escaping (Bool, String?, User?) -> Void) {
//    guard let url = URL(string: "http://18.234.107.225:8000/login") else {
//        print("Debug: URL formation failed")
//        completion(false, nil, nil)
//        return
//    }
//    
//    var request = URLRequest(url: url)
//    request.httpMethod = "POST"
//    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//    
//    let loginDetails = ["email": email, "password": password]
//    guard let jsonData = try? JSONEncoder().encode(loginDetails) else {
//        print("Debug: JSON encoding failed")
//        completion(false, nil, nil)
//        return
//    }
//    
//    request.httpBody = jsonData
//    
//    URLSession.shared.dataTask(with: request) { data, response, error in
//        if let error = error {
//            print("Debug: URLSession error - \(error.localizedDescription)")
//            DispatchQueue.main.async {
//                completion(false, nil, nil)
//            }
//            return
//        }
//        
//        if let httpResponse = response as? HTTPURLResponse {
//            print("Debug: HTTP status code - \(httpResponse.statusCode)")
//            if httpResponse.statusCode != 200 {
//                print("Debug: Server response code not 200 - actual code: \(httpResponse.statusCode)")
//                DispatchQueue.main.async {
//                    completion(false, nil, nil)
//                }
//                return
//            }
//        }
//        
//        guard let data = data, !data.isEmpty else {
//            print("Debug: No data received or data is empty")
//            DispatchQueue.main.async {
//                completion(false, nil, nil)
//            }
//            return
//        }
//
//        // Optional: Print raw JSON data
//        if let rawJSON = String(data: data, encoding: .utf8) {
//            print("Debug: Raw JSON data - \(rawJSON)")
//        }
//
//        do {
//            let response = try JSONDecoder().decode(LoginResponse.self, from: data)
//            DispatchQueue.main.async {
//                print("Debug: Login successful for user \(response.user.email)")
//                completion(true, response.token, response.user)
//            }
//        } catch {
//            print("Debug: JSON decoding failed - \(error.localizedDescription)")
//            DispatchQueue.main.async {
//                completion(false, nil, nil)
//            }
//        }
//    }.resume()
//}
