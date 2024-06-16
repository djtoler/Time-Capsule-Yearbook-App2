import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(5)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}

struct SignUpView: View {
    @State private var email = ""
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var specialty = ""
    @State private var link1 = ""
    @State private var link2 = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var navigationActive = false
    @State private var user: User?
    @State private var showAlert = false
    @State private var alertMessage = ""

    var body: some View {
        ZStack {
            // Background image
            Image("splash")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .opacity(0.7) 

            VStack(spacing: 20) {
                Text("Time Capsule Sign Up")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.top, 50)

                Spacer()
                
                TextField("Email: REQUIRED", text: $email)
                    .padding()
                    .background(Color.white.opacity(0.5)) // Adds readability to text fields
                    .cornerRadius(5)
                    .padding(.horizontal, 20)
                    
                TextField("First Name: REQUIRED", text: $firstName)
                    .padding()
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(5)
                    .padding(.horizontal, 20)
                
                TextField("Last Name: REQUIRED", text: $lastName)
                    .padding()
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(5)
                    .padding(.horizontal, 20)
                
                TextField("Specialty", text: $specialty)
                    .padding()
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(5)
                    .padding(.horizontal, 20)
                
                TextField("GitHub", text: $link1)
                    .padding()
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(5)
                    .padding(.horizontal, 20)
                
                TextField("Portfolio", text: $link2)
                    .padding()
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(5)
                    .padding(.horizontal, 20)
                
                SecureField("Password: REQUIRED", text: $password)
                    .textContentType(.none)
                    .padding()
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(5)
                    .padding(.horizontal, 20)
                
                SecureField("Confirm Password: REQUIRED", text: $confirmPassword)
                    .textContentType(.none)
                    .padding()
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(5)
                    .padding(.horizontal, 20)
                
                Button("Sign Up") {
                    if password == confirmPassword {
                        signup()
                    } else {
                        print("Passwords do not match")
                    }
                }
                .buttonStyle(PrimaryButtonStyle())

                NavigationLink(destination: LoginView(), isActive: $navigationActive) {
                    EmptyView()
                }

                Spacer()
            }
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Sign Up Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }

    func signup() {
        guard let url = URL(string: "http://54.197.82.22:8000/signup") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let signupDetails = [
            "email": email,
            "firstName": firstName,
            "lastName": lastName,
            "specialty": specialty,
            "link1": link1,
            "link2": link2,
            "password": password
        ]
        
        guard let jsonData = try? JSONEncoder().encode(signupDetails) else { return }
        
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Network request failed: \(error?.localizedDescription ?? "No error description")")
                return
            }
            
            // Attempt to parse the HTTP response
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 201 { // Assuming 201 means created successfully
                    do {
                        let response = try JSONDecoder().decode(SignupResponse.self, from: data)
                        DispatchQueue.main.async {
                            self.user = User(email: email, firstName: firstName, lastName: lastName, specialty: specialty)
                            self.navigationActive = true
                            print("Signup successful: \(response.message)")
                        }
                    } catch {
                        print("Failed to decode response: \(error)")
                        if let responseString = String(data: data, encoding: .utf8) {
                            print("Response JSON string: \(responseString)")
                        }
                    }
                } else {
                    DispatchQueue.main.async {
                        print("Signup failed: HTTP Status Code: \(httpResponse.statusCode)")
                        if let responseString = String(data: data, encoding: .utf8), let response = try? JSONDecoder().decode(SignupResponse.self, from: data) {
                            self.alertMessage = response.message
                            self.showAlert = true
                            print("Server reported failure: \(response.message)")
                        } else {
                            self.alertMessage = "An unknown error occurred."
                            self.showAlert = true
                            print("Failed to decode server failure message.")
                        }
                    }
                }
            }
        }.resume()
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}





