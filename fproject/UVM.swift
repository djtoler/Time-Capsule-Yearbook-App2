import SwiftUI
import Combine

class UserViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var errorMessage: String?
    @Published var isRefreshing = false // Track the refreshing status

    init() {
        fetchUsers()
    }

    func fetchUsers() {
        isRefreshing = true
        HeadshotFunction.fetchRecentUsers { success, users in
            DispatchQueue.main.async {
                if success {
                    self.users = users ?? []
                    self.errorMessage = nil
                } else {
                    self.errorMessage = "Failed to load users"
                }
                self.isRefreshing = false // Reset the refreshing state
            }
        }
    }
}

