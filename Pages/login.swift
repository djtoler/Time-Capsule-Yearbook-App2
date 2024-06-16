//import SwiftUI
//
//struct login: View {
//    @State private var username: String = ""
//    @State private var password: String = ""
//    
//    var body: some View {
//        NavigationView {
//            VStack(spacing: 20) {
//                
//                TextField("Username", text: $username)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .padding()
//
//                SecureField("Password", text: $password)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .padding()
//
//                Button("Log In") {
//                    sendData(action: "Log In")
//                }
//                .padding()
//                .buttonStyle(PrimaryButtonStyle())
//            }
//            .navigationTitle("Login")
//        }
//    }
//    
//    func sendData(action: String) {
//        guard let url = URL(string: "http://35.153.83.13:8000/login") else { return }
//        
//        let body: [String: Any] = ["username": username, "password": password, "action": action]
//        let finalBody = try? JSONSerialization.data(withJSONObject: body)
//        
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.httpBody = finalBody
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let data = data {
//                if let responseString = String(data: data, encoding: .utf8) {
//                    print("Response from server: \(responseString)")
//                }
//            } else if let error = error {
//                print("HTTP Request Failed \(error)")
//            }
//        }.resume()
//    }
//}
//
//struct PrimaryButtonStyle2: ButtonStyle {
//    func makeBody(configuration: Self.Configuration) -> some View {
//        configuration.label
//            .foregroundColor(.white)
//            .padding()
//            .background(Color.blue)
//            .cornerRadius(10)
//            .scaleEffect(configuration.isPressed ? 0.95 : 1)
//    }
//}
//
//struct login_Previews: PreviewProvider {
//    static var previews: some View {
//        login()
//    }
//}
//


//import SwiftUI
//
//struct LoginView: View {
//    @State private var email = ""
//    @State private var password = ""
//    @State private var loginFailed = false
//    
//    var body: some View {
//        NavigationView {
//            VStack {
//                TextField("Email", text: $email)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .padding()
//                
//                SecureField("Password", text: $password)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .padding()
//                
//                Button("Login") {
//                    print("login button working")
//                    login()
//                }
//                .padding()
//                
//                if loginFailed {
//                    Text("Login failed. Please try again.")
//                        .foregroundColor(.red)
//                }
//            }
//            .navigationTitle("Login")
//        }
//    }
//    
//    func login() {
//        print("in login function")
//        guard let url = URL(string: "http://18.234.107.225:8000/login") else { return }
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        
//        let loginDetails = ["email": email, "password": password]
//        let jsonData = try? JSONEncoder().encode(loginDetails)
//        
//        request.httpBody = jsonData
//        
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let error = error {
//                print("Login error: \(error.localizedDescription)")
//                DispatchQueue.main.async {
//                    loginFailed = true
//                }
//                return
//            }
//            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
//                print("Login successful")
//
//            } else {
//                print("Failed to log in")
//                DispatchQueue.main.async {
//                    loginFailed = true
//                }
//            }
//        }.resume()
//    }
//}
//
//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}







//import SwiftUI

//struct LoginView: View {
//    @State private var email = ""
//    @State private var password = ""
//    @State private var loginFailed = false
//    @State private var user: User? = nil  // To hold the logged-in user data
//
//    var body: some View {
//        NavigationView {
//            if let user = user {
//                // Transition to UserProfileView if login is successful
//                UserProfileView(user: user)
//            } else {
//                VStack {
//                    TextField("Email", text: $email)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .padding()
//                    
//                    SecureField("Password", text: $password)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .padding()
//                    
//                    Button("Login") {
//                        login()
//                    }
//                    .padding()
//                    
//                    if loginFailed {
//                        Text("Login failed. Please try again.")
//                            .foregroundColor(.red)
//                    }
//                }
//                .navigationTitle("Login")
//            }
//        }
//    }
//    
//    func login() {
//        guard let url = URL(string: "http://18.234.107.225:8000/login") else { return }
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        
//        let loginDetails = ["email": email, "password": password]
//        let jsonData = try? JSONEncoder().encode(loginDetails)
//        
//        request.httpBody = jsonData
//        
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let data = data, error == nil else {
//                DispatchQueue.main.async {
//                    loginFailed = true
//                }
//                print("Login error: \(error?.localizedDescription ?? "Unknown error")")
//                return
//            }
//
//            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
//                do {
//                    let response = try JSONDecoder().decode(LoginResponse.self, from: data)
//                    DispatchQueue.main.async {
//                        self.user = response.user  // Save the fetched user data
//                        loginFailed = false
//                    }
//                    print("Login successful")
//                } catch {
//                    DispatchQueue.main.async {
//                        loginFailed = true
//                    }
//                    print("Failed to decode user data: \(error)")
//                }
//            } else {
//                DispatchQueue.main.async {
//                    loginFailed = true
//                }
//                print("Failed to log in")
//            }
//        }.resume()
//    }
//
//}
//
//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}






//import SwiftUI
//
//struct LoginView: View {
//    @State private var email = ""
//    @State private var password = ""
//    @State private var loginFailed = false
//    @State private var isLoggedIn = false  // State to track login status
//    @State private var user: User? = nil  // To hold the logged-in user data
//
//    var body: some View {
//        NavigationView {
//            if isLoggedIn {
//                UserProfileView(user: user!, onLogout: {
//                    self.logout()
//                })
//            } else {
//                loginForm
//            }
//        }
//    }
//
//    var loginForm: some View {
//        VStack {
//            TextField("Email", text: $email)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .padding()
//            
//            SecureField("Password", text: $password)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .padding()
//            
//            Button("Login") {
//                login()
//            }
//            .padding()
//            
//            if loginFailed {
//                Text("Login failed. Please try again.")
//                    .foregroundColor(.red)
//            }
//        }
//        .navigationTitle("Login")
//    }
//    
//    func login() {
//        guard let url = URL(string: "http://18.234.107.225:8000/login") else { return }
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        
//        let loginDetails = ["email": email, "password": password]
//        let jsonData = try? JSONEncoder().encode(loginDetails)
//        
//        request.httpBody = jsonData
//        
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let data = data, error == nil else {
//                DispatchQueue.main.async {
//                    loginFailed = true
//                }
//                print("Login error: \(error?.localizedDescription ?? "Unknown error")")
//                return
//            }
//
//            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
//                do {
//                    let response = try JSONDecoder().decode(LoginResponse.self, from: data)
//                    DispatchQueue.main.async {
//                        self.user = response.user  // Save the fetched user data
//                        self.isLoggedIn = true    // Update the login state
//                        loginFailed = false
//                    }
//                    print("Login successful")
//                } catch {
//                    DispatchQueue.main.async {
//                        loginFailed = true
//                    }
//                    print("Failed to decode user data: \(error)")
//                }
//            } else {
//                DispatchQueue.main.async {
//                    loginFailed = true
//                }
//                print("Failed to log in")
//            }
//        }.resume()
//    }
//
//    func logout() {
//        self.user = nil
//        self.isLoggedIn = false  // Reset the login state
//        self.email = ""          // Optionally clear the form
//        self.password = ""       // Optionally clear the form
//        print("logged out")
//    }
//}
//
//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}








//import SwiftUI
//
//struct LoginView: View {
//    @State private var email = ""
//    @State private var password = ""
//    @State private var loginFailed = false
//    @State private var user: User?
//
//    var body: some View {
//        NavigationView {
//            if let user = user {
//                UserProfileView(user: user, onLogout: {
//                    self.user = nil 
//                })
//            } else {
//                LoginForm(email: $email, password: $password, loginFailed: $loginFailed) { user in
//                    self.user = user 
//                }
//            }
//        }
//    }
//}
//
//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}



import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var loginFailed = false
    @State private var user: User?
    @State private var showSignUpView = false

    var body: some View {
        NavigationView {
            if let user = user {
                TabView2()
            } else {
                VStack {
                    LoginForm(email: $email, password: $password, loginFailed: $loginFailed) { user in
                        self.user = user
                    }
                    NavigationLink(destination: SignUpView(), isActive: $showSignUpView) {
                        Button("Sign Up") {
                            self.showSignUpView = true
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                    }
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


//import SwiftUI
//
//struct LoginView: View {
//    @State private var email = ""
//    @State private var password = ""
//    @State private var loginFailed = false
//    @State private var user: User?
//
//    var body: some View {
//        NavigationView {
//            if let user = user {
//                Text("User Profile View")
//            } else {
//                Text("Login Form View")
//            }
//        }
//    }
//}
//
//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}
