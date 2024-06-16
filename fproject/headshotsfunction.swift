//import Foundation
//
//enum UserServiceError: Error {
//    case invalidURL
//    case noData
//    case decodingError
//    case networkError(Error)
//}
//
//struct HeadshotFunction {
//    static func fetchRecentUsers(completion: @escaping (Result<[User], UserServiceError>) -> Void) {
//        guard let url = URL(string: "http://18.234.107.225:8000/api/users/recent") else {
//            print("Debug: Invalid URL")
//            completion(.failure(.invalidURL))
//            return
//        }
//
//        print("Debug: Fetching users from URL: \(url)")
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                print("Debug: Network error: \(error.localizedDescription)")
//                completion(.failure(.networkError(error)))
//                return
//            }
//
//            guard let data = data else {
//                print("Debug: No data received")
//                completion(.failure(.noData))
//                return
//            }
//
//            do {
//                print("Debug: Data received: \(data)")
//                let users = try JSONDecoder().decode([User].self, from: data)
//                print("Debug: Successfully decoded users")
//                completion(.success(users))
//            } catch {
//                print("Debug: Decoding error: \(error.localizedDescription)")
//                completion(.failure(.decodingError))
//            }
//        }.resume()
//    }
//}

import Foundation






//import Foundation
//
//struct HeadshotFunction {
//    static func fetchRecentUsers(completion: @escaping (Bool, [User]?) -> Void) {
//        guard let url = URL(string: "http://54.197.82.22:8000/api/users/recent") else {
//            print("Debug: Invalid URL")
//            completion(false, nil)
//            return
//        }
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//
//        print("Debug: Fetching users from URL: \(url)")
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let error = error {
//                print("Debug: URLSession error - \(error.localizedDescription)")
//                DispatchQueue.main.async {
//                    completion(false, nil)
//                }
//                return
//            }
//
//            if let httpResponse = response as? HTTPURLResponse {
//                print("Debug: HTTP status code - \(httpResponse.statusCode)")
//                if httpResponse.statusCode != 200 {
//                    print("Debug: Server response code not 200 - actual code: \(httpResponse.statusCode)")
//                    DispatchQueue.main.async {
//                        completion(false, nil)
//                    }
//                    return
//                }
//            }
//
//            guard let data = data, !data.isEmpty else {
//                print("Debug: No data received or data is empty")
//                DispatchQueue.main.async {
//                    completion(false, nil)
//                }
//                return
//            }
//
//            // Optional: Print raw JSON data
//            if let rawJSON = String(data: data, encoding: .utf8) {
//                print("Debug: Raw JSON data - \(rawJSON)")
//            }
//
//            do {
//                let users = try JSONDecoder().decode([User].self, from: data)
//                print("Debug: Successfully decoded users")
//                DispatchQueue.main.async {
//                    completion(true, users)
//                }
//            } catch {
//                print("Debug: JSON decoding failed - \(error.localizedDescription)")
//                DispatchQueue.main.async {
//                    completion(false, nil)
//                }
//            }
//        }.resume()
//    }
//}



struct HeadshotFunction {
    static func fetchRecentUsers(completion: @escaping (Bool, [User]?) -> Void) {
        guard let url = URL(string: "http://54.197.82.22:8000/api/users/recent") else {
            print("Debug: Invalid URL")
            completion(false, nil)
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        print("Debug: Fetching users from URL: \(url)")

//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let error = error {
//                print("Debug: URLSession error - \(error.localizedDescription)")
//                DispatchQueue.main.async {
//                    completion(false, nil)
//                }
//                return
//            }
//
//            if let httpResponse = response as? HTTPURLResponse {
//                print("Debug: HTTP status code - \(httpResponse.statusCode)")
//                if httpResponse.statusCode != 200 {
//                    print("Debug: Server response code not 200 - actual code: \(httpResponse.statusCode)")
//                    DispatchQueue.main.async {
//                        completion(false, nil)
//                    }
//                    return
//                }
//            }
//
//            guard let data = data, !data.isEmpty else {
//                print("Debug: No data received or data is empty")
//                DispatchQueue.main.async {
//                    completion(false, nil)
//                }
//                return
//            }
//
//            // Optional: Print raw JSON data
//            if let rawJSON = String(data: data, encoding: .utf8) {
//                print("Debug: Raw JSON data - \(rawJSON)")
//            }
//
//            do {
//                let decoder = JSONDecoder()
//                decoder.keyDecodingStrategy = .useDefaultKeys // Ensure default key decoding strategy
//                let users = try decoder.decode([User].self, from: data)
//                print("Debug: Successfully decoded users")
//                DispatchQueue.main.async {
//                    completion(true, users)
//                }
//            } catch let DecodingError.dataCorrupted(context) {
//                print("Debug: Data corrupted - \(context.debugDescription)")
//            } catch let DecodingError.keyNotFound(key, context) {
//                print("Debug: Key '\(key)' not found: \(context.debugDescription)")
//            } catch let DecodingError.typeMismatch(type, context) {
//                print("Debug: Type '\(type)' mismatch: \(context.debugDescription)")
//            } catch let DecodingError.valueNotFound(value, context) {
//                print("Debug: Value '\(value)' not found: \(context.debugDescription)")
//            } catch {
//                print("Debug: JSON decoding failed - \(error.localizedDescription)")
//            }
//
//            DispatchQueue.main.async {
//                completion(false, nil)
//            }
//        }.resume()
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

            // Using try? to safely decode JSON data
            let users = try? JSONDecoder().decode([User].self, from: data)
            if let users = users {
                print("Debug: Successfully decoded users")
                DispatchQueue.main.async {
                    completion(true, users)
                }
            } else {
                print("Debug: JSON decoding failed - Unable to decode to [User]")
                DispatchQueue.main.async {
                    completion(false, nil)
                }
            }
        }.resume()

    }
}
