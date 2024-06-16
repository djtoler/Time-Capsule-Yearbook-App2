import SwiftUI

struct UserGridView: View {
    @State private var users: [User] = []
    @State private var errorMessage: String?

    var body: some View {
        NavigationView {
            ScrollView {
                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                } else {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]) {
                        ForEach(users) { user in
                            VStack {
                                // Replace with your image loading logic
                                if let urlString = user.profilePicture, let url = URL(string: urlString) {
                                    AsyncImage(url: url) { image in
                                        image.resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 100, height: 100)
                                            .clipped()
                                    } placeholder: {
                                        Color.gray
                                            .frame(width: 100, height: 100)
                                    }
                                } else {
                                    Color.gray
                                        .frame(width: 100, height: 100)
                                }
                                Text("\(user.firstName) \(user.lastName)")
                                    .font(.caption)
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Yearbook")
            .onAppear {
                HeadshotFunction.fetchRecentUsers { success, users in
                    DispatchQueue.main.async {
                        if success {
                            self.users = users ?? []
                        } else {
                            self.errorMessage = "Failed to load users"
                        }
                    }
                }
            }
        }
    }
}

struct UserGridView_Previews: PreviewProvider {
    static var previews: some View {
        UserGridView()
    }
}

