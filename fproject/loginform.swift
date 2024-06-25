import SwiftUI

struct LoginForm: View {
    @Binding var email: String
    @Binding var password: String
    @Binding var loginFailed: Bool
    var onLoginSuccess: (User) -> Void

    var body: some View {
        VStack {
            Spacer()
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Login") {
                login(email: email, password: password) { success, user in
                    if success, let user = user {
                        onLoginSuccess(user)
                    } else {
                        loginFailed = true
                    }
                }
            }
            .padding()
            .buttonStyle(.plain) // Use a plain style as a base
            .background(Color.red) // Set the background color to black
            .foregroundColor(.white) // Set the text color to white
            .frame(minWidth: 100, maxWidth: .infinity) // Set a minimum width for the button and allow it to expand
            .padding() // Add padding inside the button to increase its size
            .cornerRadius(10) // Add rounded corners
            .font(.system(size: 30, weight: .bold))
            
            if loginFailed {
                Text("Login failed. Please try again.")
                    .foregroundColor(.red)
            }
        }
        .navigationTitle("")
        .background(Image("logo").resizable().scaledToFill().edgesIgnoringSafeArea(.all))
    }
    
}

