import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = SearchViewModel()
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        NavigationView {
            ZStack {
                // Background image
                Image("NotificationBackground3")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all) // Cover entire screen

                VStack {
                    Spacer().frame(height: 60) // Add space at the top
                    Text("Search for Classmates")
                        .font(.custom("varsity", size: 40))
                        .foregroundColor(.white)
                        .padding(.top, 20)

                    Text("by first name or last name")
                        .font(.custom("varsity", size: 20))
                        .foregroundColor(.white)
                        .padding(.bottom, 20)

                    HStack {
                        VStack {
                            Text("First Name")
                                .font(.custom("varsity", size: 20))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .center)

                            TextField("Enter first name", text: $firstName)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding()
                                .foregroundColor(.black)
                                .background(Color.white)
                                .cornerRadius(5)
                        }
                        .padding()

                        VStack {
                            Text("Last Name")
                                .font(.custom("varsity", size: 20))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .center)

                            TextField("Enter last name", text: $lastName)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding()
                                .foregroundColor(.black)
                                .background(Color.white)
                                .cornerRadius(5)
                        }
                        .padding()
                    }

                    Button(action: {
                        viewModel.searchUsers(firstName: firstName, lastName: lastName)
                    }) {
                        Text("Search")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .padding()

                    ScrollView {
                        LazyVGrid(columns: [
                            GridItem(.flexible(minimum: 100, maximum: .infinity), spacing: 32),
                            GridItem(.flexible(minimum: 100, maximum: .infinity), spacing: 32)
                        ], spacing: 30) {
                            ForEach(viewModel.searchResults) { user in
                                NavigationLink(destination: UserProfileViewAlt(user: user)) {
                                    VStack(spacing: 5) {
                                        if let urlString = user.profilePicture, let url = URL(string: urlString) {
                                            AsyncImage(url: url) { image in
                                                image.resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(width: 120, height: 175)
                                                    .clipped()
                                                    .background(Color.black)
                                                    .overlay(
                                                        Rectangle()
                                                            .stroke(Color.white)
                                                    )
                                            } placeholder: {
                                                Color.black
                                                    .frame(width: 120, height: 175)
                                                    .overlay(
                                                        Rectangle()
                                                            .stroke(Color.white)
                                                    )
                                            }
                                        } else {
                                            Color.black
                                                .frame(width: 120, height: 175)
                                                .overlay(
                                                    Rectangle()
                                                        .stroke(Color.white)
                                                )
                                        }
                                        Text(user.firstName + " " + user.lastName)
                                            .font(.custom("varsity", size: 20))
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.white)
                                        Text(user.specialty)
                                            .font(.custom("CaviarDreams", size: 15))
                                            .fontWeight(.semibold)
                                            .frame(width: 109, height: 24)
                                            .background(Color.black)
                                            .foregroundColor(.white)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 4)
                                                    .stroke(Color.white)
                                            )
                                        Text("PM ADA")
                                            .font(.custom("CaviarDreams", size: 15))
                                            .fontWeight(.semibold)
                                            .frame(width: 109, height: 24)
                                            .multilineTextAlignment(.center)
                                            .background(Color.black)
                                            .foregroundColor(.white)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 4)
                                                    .stroke(Color.white)
                                            )
                                    }
                                    .padding()
                                }
                                .simultaneousGesture(TapGesture().onEnded {
                                    print("Selected user's email: \(user.email)")
                                })
                            }
                        }
                        .padding()
                    }

                    Spacer()
                }
                .padding()
            }
            .navigationBarItems(leading: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Image(systemName: "arrow.left")
                    Text("Back")
                }
                .foregroundColor(.white)
            })
            .navigationBarHidden(true) // Hide the navigation bar for better appearance
        }
    }
}

class SearchViewModel: ObservableObject {
    @Published var searchResults: [User] = []

    func searchUsers(firstName: String, lastName: String) {
        var components = URLComponents(string: "http://54.197.82.22:8000/search")!
        var queryItems = [URLQueryItem]()
        if !firstName.isEmpty {
            queryItems.append(URLQueryItem(name: "firstName", value: firstName))
        }
        if !lastName.isEmpty {
            queryItems.append(URLQueryItem(name: "lastName", value: lastName))
        }
        components.queryItems = queryItems

        guard let url = components.url else { return }

        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let users = try? JSONDecoder().decode([User].self, from: data) {
                    DispatchQueue.main.async {
                        self.searchResults = users
                    }
                }
            }
        }.resume()
    }
}




struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

