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


