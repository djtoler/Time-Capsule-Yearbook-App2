import SwiftUI

struct UserNotificationsView: View {
    @State private var currentUser: User?

    var body: some View {
        Group {
            if let user = currentUser {
                NotificationsView(user: user)
                    .onAppear {
                        print("User loaded successfully: \(user.email)")
                    }
            } else {
                Text("Loading...")
                    .onAppear {
                        print("Attempting to load user from UserDefaults...")
                        if let loadedUser = User.loadFromUserDefaults() {
                            self.currentUser = loadedUser
                            print("User loaded: \(loadedUser.email)")
                        } else {
                            print("Failed to load user from UserDefaults.")
                        }
                    }
            }
        }
    }
}

struct UserNotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        UserNotificationsView()
    }
}

