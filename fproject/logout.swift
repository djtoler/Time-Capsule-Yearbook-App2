import SwiftUI

//struct LogoutButtonView: View {
//    @EnvironmentObject var sessionManager: UserSessionManager
//
//    var body: some View {
//        Button(action: {
//            sessionManager.logoutUser()
//        }) {
//            Text("Logout")
//                .foregroundColor(.white)
//                .padding()
//                .background(Color.red)
//                .clipShape(Capsule())
//        }
//    }
//}

// For preview purposes
struct LogoutButtonView: View {
    var onLogout: () -> Void

    var body: some View {
        Button("Logout", action: onLogout)
    }
}

