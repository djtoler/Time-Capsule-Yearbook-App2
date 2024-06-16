//import SwiftUI
//import Combine
//
//struct AdminPanelView: View {
//    @State private var email: String = ""
//    @State private var user: User?
//    @State private var isLoading: Bool = false
//    @State private var showUserSheet = false
//
//
//    var body: some View {
//        ZStack {
//            Image("splash")
//                .resizable()
//                .scaledToFill()
//                .edgesIgnoringSafeArea(.all)
//
//            ScrollView {
//                VStack {
//                    Spacer(minLength: 50)
//                    
//                    VStack(alignment: .center) {
//                        Text("Example Academy")
//                            .font(.custom("Varsity", size: 25))
//                            .foregroundColor(.white)
//                            .padding(.top, 20)
//
//                        Text("Admin Panel")
//                            .font(.custom("Varsity", size: 80))
//                            .foregroundColor(.white)
//                            .padding(.bottom, 20)
//                    }
//
//                    VStack {
//                        TextField("Enter user's email", text: $email)
//                            .textFieldStyle(RoundedBorderTextFieldStyle())
//                            .padding()
//                            .font(.custom("Varsity", size: 18))
//
//                        Button("Search") {
//                            isLoading = true
//                            print("Searching for user with email: \(email)")
//                            fetchUserData(email: email)
//                        }
//                        .font(.custom("Varsity", size: 18))
//
//                        if isLoading {
//                            ProgressView("Loading...")
//                        }
//
//                        if let user = user {
//                            UserView(user: user)
//                                .onReceive(Just(user)) { _ in
//                                    print("User data updated in view.")
//                                }
//                        } else if !isLoading {
//                            Text("No user data available or search not yet performed.")
//                                .padding()
//                        }
//                    }
//                    .padding(.horizontal)
//                    Spacer()
//                }
//            }
//            .sheet(isPresented: $showUserSheet) {
//                if let user = user {
//                    UserView(user: user)
//                }
//            }
//        }
//    }
//
//    func fetchUserData(email: String) {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            self.user = User.mocked(email: email)
//            self.isLoading = false
//            self.showUserSheet = true  // Show the sheet when data is fetched
//        }
//    }
//}
//
//struct UserView: View {
//    var user: User
//    var body: some View {
//        List {
//            ProfileRow(label: "Email", value: user.email)
//            ProfileRow(label: "First Name", value: user.firstName)
//            ProfileRow(label: "Last Name", value: user.lastName)
//            ProfileRow(label: "Specialty", value: user.specialty)
//            if let accessCode = user.accessCode {
//                ProfileRow(label: "Access Code", value: accessCode)
//            }
//            if let profilePicture = user.profilePicture {
//                ImageRow(label: "Profile Picture", imageUrl: profilePicture)
//            }
//            // Using ForEach to iterate over image URLs
//            ForEach(user.imageUrls.compactMap { $0 }, id: \.self) { imageUrl in
//                ImageRow(label: "Image", imageUrl: imageUrl)
//            }
//        }
//    }
//}
//
//
//extension User {
//    var imageUrls: [String?] {
//        return [image01, image02, image03, image04, image05, image06, image07, image08]
//    }
//
//    static func mocked(email: String) -> User {
//        // Returns a mocked user with specific data, adjust as needed
//        return User(
//               email: email,
//               firstName: "Ivy",
//               lastName: "King",
//               specialty: "QA Testing",
//               accessCode: "ACC131",
//               image01: "https://example.com/image01.jpg", image02: "https://example.com/image02.jpg", image03: "https://example.com/image03.jpg", image04: "https://example.com/image04.jpg", image05: "https://example.com/image05.jpg", image06: "https://example.com/image06.jpg", image07: "https://example.com/image07.jpg", image08: "https://example.com/image08.jpg", profilePicture: "https://adayearbook1.s3.amazonaws.com/pic9.jpg",
//               link01: "https://example.com/link01",
//               link02: "https://example.com/link02"
//           )
//    }
//}
//
//struct ProfileRow: View {
//    let label: String
//    let value: String
//
//    var body: some View {
//        HStack {
//            Text("\(label): \(value)")
//            Spacer()
//        }
//        .font(.custom("Varsity", size: 18))
//    }
//}
//
//struct ImageRow: View {
//    let label: String
//    let imageUrl: String
//
//    var body: some View {
//        HStack {
//            Image(systemName: "photo")
//                .resizable()
//                .scaledToFit()
//                .frame(width: 30, height: 30)
//                .clipShape(Circle())
//                .overlay(Circle().stroke(Color.white, lineWidth: 2))
//            Text(imageUrl)
//                .lineLimit(1)
//            Spacer()
//        }
//        .font(.custom("Varsity", size: 18))
//    }
//}
//
//struct AdminPanelView_Previews: PreviewProvider {
//    static var previews: some View {
//        AdminPanelView()
//    }
//}
//










//import SwiftUI
//import Combine
//
//struct AdminPanelView: View {
//    @State private var email: String = ""
//    @State private var accessCode: String = ""
//    @State private var user: User?
//    @State private var isLoading: Bool = false
//    @State private var showUserSheet = false
//    @State private var cancellable: AnyCancellable?
//    @State private var updatedUser: User?
//
//
//    var body: some View {
//        ZStack {
//            Image("splash")
//                .resizable()
//                .scaledToFill()
//                .edgesIgnoringSafeArea(.all)
//
//            ScrollView {
//                VStack {
//                    Spacer(minLength: 50)
//                    
//                    VStack(alignment: .center) {
//                        Text("Example Academy")
//                            .font(.custom("Varsity", size: 25))
//                            .foregroundColor(.white)
//                            .padding(.top, 20)
//
//                        Text("Admin Panel")
//                            .font(.custom("Varsity", size: 80))
//                            .foregroundColor(.white)
//                            .padding(.bottom, 20)
//                    }
//
//                    VStack {
//                        TextField("Enter user's email", text: $email)
//                            .textFieldStyle(RoundedBorderTextFieldStyle())
//                            .padding()
//                            .font(.custom("Varsity", size: 18))
//                            .autocapitalization(.none) // Disable auto-capitalization
//                            .onChange(of: email) { newValue in
//                                email = newValue.lowercased()
//                            }
//
//                        TextField("Enter access code", text: $accessCode)
//                            .textFieldStyle(RoundedBorderTextFieldStyle())
//                            .padding()
//                            .font(.custom("Varsity", size: 18))
//                            .autocapitalization(.none) // Disable auto-capitalization
//                            .onChange(of: accessCode) { newValue in
//                                accessCode = newValue.lowercased()
//                            }
//
//
//                        Button("Search") {
//                            isLoading = true
//                            print("Searching for user with email: \(email) and access code: \(accessCode)")
//                            fetchUserData(email: email, accessCode: accessCode)
//                        }
//                        .font(.custom("Varsity", size: 18))
//
//                        if isLoading {
//                            ProgressView("Loading...")
//                        }
//
//                        if let user = user {
//                            UserView(user: user)
//                                .onReceive(Just(user)) { _ in
//                                    print("User data updated in view.")
//                                }
//                        } else if !isLoading {
//                            Text("No user data available or search not yet performed.")
//                                .padding()
//                        }
//                    }
//                    .padding(.horizontal)
//                    Spacer()
//                }
//            }
//            .sheet(isPresented: $showUserSheet) {
//                if let user = user {
//                    UserView(user: user)
//                }
//            }
//        }
//    }
//
//    func fetchUserData(email: String, accessCode: String) {
//        let urlString = "http://54.197.82.22:8000/users?email=\(email)&accessCode=\(accessCode)"
//        guard let url = URL(string: urlString) else {
//            print("Invalid URL")
//            self.isLoading = false
//            return
//        }
//
//        cancellable = URLSession.shared.dataTaskPublisher(for: url)
//            .map { $0.data }
//            .decode(type: User.self, decoder: JSONDecoder())
//            .receive(on: DispatchQueue.main)
//            .sink(receiveCompletion: { completion in
//                self.isLoading = false
//                switch completion {
//                case .finished:
//                    break
//                case .failure(let error):
//                    print("Error fetching user data: \(error.localizedDescription)")
//                    self.user = nil
//                }
//            }, receiveValue: { user in
//                self.user = user
//                self.showUserSheet = true  // Show the sheet when data is fetched
//            })
//    }
//}
//
//struct UserView: View {
//    var user: User
//    var body: some View {
//        List {
//             ProfileRow(label: "Email", value: user.email)
//             ProfileRow(label: "First Name", value: user.firstName)
//             ProfileRow(label: "Last Name", value: user.lastName)
//             ProfileRow(label: "Specialty", value: user.specialty)
//             if let accessCode = user.accessCode {
//                 ProfileRow(label: "Access Code", value: accessCode)
//             }
//             if let profilePicture = user.profilePicture {
//                 ImageRow(label: "Profile Picture", imageUrl: profilePicture, user: $user, field: "profilePicture")
//             }
//             if let image01 = user.image01 {
//                 ImageRow(label: "Image 01", imageUrl: image01, user: $user, field: "image01")
//             }
//             if let image02 = user.image02 {
//                 ImageRow(label: "Image 02", imageUrl: image02, user: $user, field: "image02")
//             }
//             if let image03 = user.image03 {
//                 ImageRow(label: "Image 03", imageUrl: image03, user: $user, field: "image03")
//             }
//             if let image04 = user.image04 {
//                 ImageRow(label: "Image 04", imageUrl: image04, user: $user, field: "image04")
//             }
//             if let image05 = user.image05 {
//                 ImageRow(label: "Image 05", imageUrl: image05, user: $user, field: "image05")
//             }
//             if let image06 = user.image06 {
//                 ImageRow(label: "Image 06", imageUrl: image06, user: $user, field: "image06")
//             }
//         }
//    }
//}
//
//
//extension User {
//    var imageUrls: [String?] {
//        return [image01, image02, image03, image04, image05, image06, image07, image08]
//    }
//}
//
//struct ImageRow: View {
//    let label: String
//    let imageUrl: String
//    @Binding var user: User
//    let field: String
//
//    var body: some View {
//        HStack {
//            AsyncImage(url: URL(string: imageUrl)) { phase in
//                if let image = phase.image {
//                    image
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 50, height: 50)
//                        .clipShape(Circle())
//                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
//                } else if phase.error != nil {
//                    Image(systemName: "photo")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 50, height: 50)
//                        .foregroundColor(.gray)
//                } else {
//                    ProgressView()
//                        .frame(width: 50, height: 50)
//                }
//            }
//            Text("\(label)")
//            Spacer()
//            Button(action: {
//                updateImageUrl()
//            }) {
//                Image(systemName: "trash")
//                    .foregroundColor(.red)
//            }
//        }
//        .font(.custom("Varsity", size: 18))
//    }
//
//    func updateImageUrl() {
//        guard let url = URL(string: "http://54.197.82.22:8000/updateImage") else { return }
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        let newImageUrl = "https://adayearbook1.s3.amazonaws.com/cs.jpg"
//        let body: [String: Any] = [
//            "email": user.email,
//            "field": field,
//            "newImageUrl": newImageUrl
//        ]
//
//        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let error = error {
//                print("Error updating image URL:", error)
//                return
//            }
//
//            if let data = data {
//                if let updatedUser = try? JSONDecoder().decode(User.self, from: data) {
//                    DispatchQueue.main.async {
//                        self.user = updatedUser
//                    }
//                }
//            }
//        }.resume()
//    }
//}
//
//struct ProfileRow: View {
//    let label: String
//    let value: String
//
//    var body: some View {
//        HStack {
//            Text("\(label): \(value)")
//            Spacer()
//        }
//        .font(.custom("Varsity", size: 18))
//    }
//}
//
//
//struct AdminPanelView_Previews: PreviewProvider {
//    static var previews: some View {
//        AdminPanelView()
//    }
//}




//import SwiftUI
//import Combine
//
//struct AdminPanelView: View {
//    @State private var email: String = ""
//    @State private var accessCode: String = ""
//    @State private var user: User?
//    @State private var isLoading: Bool = false
//    @State private var showUserSheet = false
//    @State private var cancellable: AnyCancellable?
//    @State private var updatedUser: User?
//
//    var body: some View {
//        ZStack {
//            Image("splash")
//                .resizable()
//                .scaledToFill()
//                .edgesIgnoringSafeArea(.all)
//
//            ScrollView {
//                VStack {
//                    Spacer(minLength: 50)
//                    
//                    VStack(alignment: .center) {
//                        Text("Example Academy")
//                            .font(.custom("Varsity", size: 25))
//                            .foregroundColor(.white)
//                            .padding(.top, 20)
//
//                        Text("Admin Panel")
//                            .font(.custom("Varsity", size: 80))
//                            .foregroundColor(.white)
//                            .padding(.bottom, 20)
//                    }
//
//                    VStack {
//                        TextField("Enter user's email", text: $email)
//                            .textFieldStyle(RoundedBorderTextFieldStyle())
//                            .padding()
//                            .font(.custom("Varsity", size: 18))
//                            .autocapitalization(.none) // Disable auto-capitalization
//                            .onChange(of: email) { newValue in
//                                email = newValue.lowercased()
//                            }
//
//                        TextField("Enter access code", text: $accessCode)
//                            .textFieldStyle(RoundedBorderTextFieldStyle())
//                            .padding()
//                            .font(.custom("Varsity", size: 18))
//                            .autocapitalization(.none) // Disable auto-capitalization
//                            .onChange(of: accessCode) { newValue in
//                                accessCode = newValue.lowercased()
//                            }
//
//                        Button("Search") {
//                            isLoading = true
//                            print("Searching for user with email: \(email) and access code: \(accessCode)")
//                            fetchUserData(email: email, accessCode: accessCode)
//                        }
//                        .font(.custom("Varsity", size: 18))
//
//                        if isLoading {
//                            ProgressView("Loading...")
//                        }
//
//                        if let user = user {
//                            UserView(user: Binding($user)!) // Pass the binding to UserView
//                                .onReceive(Just(user)) { _ in
//                                    print("User data updated in view.")
//                                }
//                        } else if !isLoading {
//                            Text("No user data available or search not yet performed.")
//                                .padding()
//                        }
//
//                    }
//                    .padding(.horizontal)
//                    Spacer()
//                }
//            }
//            .sheet(isPresented: $showUserSheet) {
//                if let user = user {
//                    UserView(user: Binding($user)!)
//                        .onReceive(Just(user)) { _ in
//                            print("User data updated in view.")
//                        }
//                } else if !isLoading {
//                    Text("No user data available or search not yet performed.")
//                        .padding()
//                }
//            }
//        }
//    }
//
//    func fetchUserData(email: String, accessCode: String) {
//        let urlString = "http://54.197.82.22:8000/users?email=\(email)&accessCode=\(accessCode)"
//        guard let url = URL(string: urlString) else {
//            print("Invalid URL")
//            self.isLoading = false
//            return
//        }
//
//        cancellable = URLSession.shared.dataTaskPublisher(for: url)
//            .map { $0.data }
//            .decode(type: User.self, decoder: JSONDecoder())
//            .receive(on: DispatchQueue.main)
//            .sink(receiveCompletion: { completion in
//                self.isLoading = false
//                switch completion {
//                case .finished:
//                    break
//                case .failure(let error):
//                    print("Error fetching user data: \(error.localizedDescription)")
//                    self.user = nil
//                }
//            }, receiveValue: { user in
//                self.user = user
//                self.showUserSheet = true  // Show the sheet when data is fetched
//            })
//    }
//}
//
//struct UserView: View {
//    @Binding var user: User // Accept a binding to the User
//
//    var body: some View {
//        List {
//            ProfileRow(label: "Email", value: user.email)
//            ProfileRow(label: "First Name", value: user.firstName)
//            ProfileRow(label: "Last Name", value: user.lastName)
//            ProfileRow(label: "Specialty", value: user.specialty)
//            if let accessCode = user.accessCode {
//                ProfileRow(label: "Access Code", value: accessCode)
//            }
//            if let profilePicture = user.profilePicture {
//                ImageRow(label: "Profile Picture", imageUrl: profilePicture, user: $user, field: "profilePicture")
//            }
//            if let image01 = user.image01 {
//                ImageRow(label: "Image 01", imageUrl: image01, user: $user, field: "image01")
//            }
//            if let image02 = user.image02 {
//                ImageRow(label: "Image 02", imageUrl: image02, user: $user, field: "image02")
//            }
//            if let image03 = user.image03 {
//                ImageRow(label: "Image 03", imageUrl: image03, user: $user, field: "image03")
//            }
//            if let image04 = user.image04 {
//                ImageRow(label: "Image 04", imageUrl: image04, user: $user, field: "image04")
//            }
//            if let image05 = user.image05 {
//                ImageRow(label: "Image 05", imageUrl: image05, user: $user, field: "image05")
//            }
//            if let image06 = user.image06 {
//                ImageRow(label: "Image 06", imageUrl: image06, user: $user, field: "image06")
//            }
//        }
//    }
//}
//
//extension User {
//    var imageUrls: [String?] {
//        return [image01, image02, image03, image04, image05, image06, image07, image08]
//    }
//}
//
//struct ImageRow: View {
//    let label: String
//    let imageUrl: String
//    @Binding var user: User
//    let field: String
//
//    var body: some View {
//        HStack {
//            AsyncImage(url: URL(string: imageUrl)) { phase in
//                if let image = phase.image {
//                    image
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 50, height: 50)
//                        .clipShape(Circle())
//                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
//                } else if phase.error != nil {
//                    Image(systemName: "photo")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 50, height: 50)
//                        .foregroundColor(.gray)
//                } else {
//                    ProgressView()
//                        .frame(width: 50, height: 50)
//                }
//            }
//            Text("\(label)")
//            Spacer()
//            Button(action: {
//                updateImageUrl()
//            }) {
//                Image(systemName: "trash")
//                    .foregroundColor(.red)
//            }
//        }
//        .font(.custom("Varsity", size: 18))
//    }
//
//    func updateImageUrl() {
//        guard let url = URL(string: "http://54.197.82.22:8000/updateImage") else { return }
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        let newImageUrl = "https://adayearbook1.s3.amazonaws.com/cs.jpg"
//        let body: [String: Any] = [
//            "email": user.email,
//            "field": field,
//            "newImageUrl": newImageUrl
//        ]
//
//        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let error = error {
//                print("Error updating image URL:", error)
//                return
//            }
//
//            if let data = data {
//                if let updatedUser = try? JSONDecoder().decode(User.self, from: data) {
//                    DispatchQueue.main.async {
//                        self.user = updatedUser
//                    }
//                }
//            }
//        }.resume()
//    }
//}
//
//struct ProfileRow: View {
//    let label: String
//    let value: String
//
//    var body: some View {
//        HStack {
//            Text("\(label): \(value)")
//            Spacer()
//        }
//        .font(.custom("Varsity", size: 18))
//    }
//}
//
//struct AdminPanelView_Previews: PreviewProvider {
//    static var previews: some View {
//        AdminPanelView()
//    }
//}






//import SwiftUI
//import Combine
//
//struct AdminPanelView: View {
//    @State private var email: String = ""
//    @State private var accessCode: String = ""
//    @State private var user: User?
//    @State private var isLoading: Bool = false
//    @State private var showUserSheet = false
//    @State private var cancellable: AnyCancellable?
//    @State private var updatedUser: User?
//
//    var body: some View {
//        ZStack {
//            Image("splash")
//                .resizable()
//                .scaledToFill()
//                .edgesIgnoringSafeArea(.all)
//
//            ScrollView {
//                VStack {
//                    Spacer(minLength: 50)
//                    
//                    VStack(alignment: .center) {
//                        Text("Example Academy")
//                            .font(.custom("Varsity", size: 25))
//                            .foregroundColor(.white)
//                            .padding(.top, 20)
//
//                        Text("Admin Panel")
//                            .font(.custom("Varsity", size: 80))
//                            .foregroundColor(.white)
//                            .padding(.bottom, 20)
//                    }
//
//                    VStack {
//                        TextField("Enter user's email", text: $email)
//                            .textFieldStyle(RoundedBorderTextFieldStyle())
//                            .padding()
//                            .font(.custom("Varsity", size: 18))
//                            .autocapitalization(.none) // Disable auto-capitalization
//                            .onChange(of: email) { newValue in
//                                email = newValue.lowercased()
//                            }
//
//                        TextField("Enter access code", text: $accessCode)
//                            .textFieldStyle(RoundedBorderTextFieldStyle())
//                            .padding()
//                            .font(.custom("Varsity", size: 18))
//                            .autocapitalization(.none) // Disable auto-capitalization
//                            .onChange(of: accessCode) { newValue in
//                                accessCode = newValue.lowercased()
//                            }
//
//                        Button("Search") {
//                            isLoading = true
//                            print("Searching for user with email: \(email) and access code: \(accessCode)")
//                            fetchUserData(email: email, accessCode: accessCode)
//                        }
//                        .font(.custom("Varsity", size: 18))
//
//                        if isLoading {
//                            ProgressView("Loading...")
//                        }
//
//                        if let user = user {
//                            UserView(user: Binding($user)!) // Pass the binding to UserView
//                                .onReceive(Just(user)) { _ in
//                                    print("User data updated in view.")
//                                }
//                        } else if !isLoading {
//                            Text("No user data available or search not yet performed.")
//                                .padding()
//                        }
//
//                    }
//                    .padding(.horizontal)
//                    Spacer()
//                }
//            }
//            .sheet(isPresented: $showUserSheet) {
//                if let user = user {
//                    UserView(user: Binding($user)!)
//                        .onReceive(Just(user)) { _ in
//                            print("User data updated in view.")
//                        }
//                } else if !isLoading {
//                    Text("No user data available or search not yet performed.")
//                        .padding()
//                }
//            }
//        }
//    }
//
//    func fetchUserData(email: String, accessCode: String) {
//        let urlString = "http://54.197.82.22:8000/users?email=\(email)&accessCode=\(accessCode)"
//        guard let url = URL(string: urlString) else {
//            print("Invalid URL")
//            self.isLoading = false
//            return
//        }
//
//        cancellable = URLSession.shared.dataTaskPublisher(for: url)
//            .map { $0.data }
//            .decode(type: User.self, decoder: JSONDecoder())
//            .receive(on: DispatchQueue.main)
//            .sink(receiveCompletion: { completion in
//                self.isLoading = false
//                switch completion {
//                case .finished:
//                    break
//                case .failure(let error):
//                    print("Error fetching user data: \(error.localizedDescription)")
//                    self.user = nil
//                }
//            }, receiveValue: { user in
//                self.user = user
//                self.showUserSheet = true  // Show the sheet when data is fetched
//            })
//    }
//}
//
//struct UserView: View {
//    @Binding var user: User
//
//    var body: some View {
//        List {
//            ProfileRow(label: "Email", value: user.email)
//            ProfileRow(label: "First Name", value: user.firstName)
//            ProfileRow(label: "Last Name", value: user.lastName)
//            ProfileRow(label: "Specialty", value: user.specialty)
//            if let accessCode = user.accessCode {
//                ProfileRow(label: "Access Code", value: accessCode)
//            }
//            if let profilePicture = user.profilePicture {
//                ImageRow(label: "Profile Picture", imageUrl: profilePicture, user: $user, field: "profilePicture")
//            }
//            if let image01 = user.image01 {
//                ImageRow(label: "Image 01", imageUrl: image01, user: $user, field: "image01")
//            }
//            if let image02 = user.image02 {
//                ImageRow(label: "Image 02", imageUrl: image02, user: $user, field: "image02")
//            }
//            if let image03 = user.image03 {
//                ImageRow(label: "Image 03", imageUrl: image03, user: $user, field: "image03")
//            }
//            if let image04 = user.image04 {
//                ImageRow(label: "Image 04", imageUrl: image04, user: $user, field: "image04")
//            }
//            if let image05 = user.image05 {
//                ImageRow(label: "Image 05", imageUrl: image05, user: $user, field: "image05")
//            }
//            if let image06 = user.image06 {
//                ImageRow(label: "Image 06", imageUrl: image06, user: $user, field: "image06")
//            }
//            if let comments = user.comments {
//                ForEach(comments.indices, id: \.self) { index in
//                    CommentRow(comment: Binding(get: {
//                        user.comments![index]
//                    }, set: {
//                        user.comments![index] = $0
//                    }), userEmail: user.email)
//                }
//            }
//        }
//    }
//}
//
//
//
//struct ImageRow: View {
//    let label: String
//    let imageUrl: String
//    @Binding var user: User
//    let field: String
//
//    var body: some View {
//        HStack {
//            AsyncImage(url: URL(string: imageUrl)) { phase in
//                if let image = phase.image {
//                    image
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 50, height: 50)
//                        .clipShape(Circle())
//                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
//                } else if phase.error != nil {
//                    Image(systemName: "photo")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 50, height: 50)
//                        .foregroundColor(.gray)
//                } else {
//                    ProgressView()
//                        .frame(width: 50, height: 50)
//                }
//            }
//            Text("\(label)")
//            Spacer()
//            Button(action: {
//                updateImageUrl()
//            }) {
//                Image(systemName: "trash")
//                    .foregroundColor(.red)
//            }
//        }
//        .font(.custom("Varsity", size: 18))
//    }
//
//    func updateImageUrl() {
//        guard let url = URL(string: "http://54.197.82.22:8000/updateImage") else { return }
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        let newImageUrl = "https://adayearbook1.s3.amazonaws.com/cs.jpg"
//        let body: [String: Any] = [
//            "email": user.email,
//            "field": field,
//            "newImageUrl": newImageUrl
//        ]
//
//        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let error = error {
//                print("Error updating image URL:", error)
//                return
//            }
//
//            if let data = data {
//                if let updatedUser = try? JSONDecoder().decode(User.self, from: data) {
//                    DispatchQueue.main.async {
//                        self.user = updatedUser
//                    }
//                }
//            }
//        }.resume()
//    }
//}
//
//
//
//struct CommentRow: View {
//    @Binding var comment: Comment
//    var userEmail: String  // Add this property
//
//    var body: some View {
//        HStack {
//            Text(comment.comment)
//            Spacer()
//            Button(action: {
//                let oldComment = comment.comment
//                comment.comment = "This comment has been removed"
//                updateComment(email: userEmail, oldComment: oldComment, newComment: comment.comment)
//            }) {
//                Image(systemName: "trash")
//                    .foregroundColor(.red)
//            }
//        }
//        .font(.custom("Wildy", size: 17))
//    }
//
//    func updateComment(email: String, oldComment: String, newComment: String) {
//        guard let url = URL(string: "http://54.197.82.22:8000/updateComment") else { return }
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        let body: [String: Any] = [
//            "email": email,
//            "oldComment": oldComment,
//            "newComment": newComment
//        ]
//
//        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let error = error {
//                print("Error updating comment:", error)
//                return
//            }
//
//            if let data = data {
//                if let updatedUser = try? JSONDecoder().decode(User.self, from: data) {
//                    DispatchQueue.main.async {
//                        // Update the user data if needed
//                    }
//                }
//            }
//        }.resume()
//    }
//}
//
//
//struct ProfileRow: View {
//    let label: String
//    let value: String
//
//    var body: some View {
//        HStack {
//            Text("\(label): \(value)")
//            Spacer()
//        }
//        .font(.custom("Varsity", size: 18))
//    }
//}
//
//struct AdminPanelView_Previews: PreviewProvider {
//    static var previews: some View {
//        AdminPanelView()
//    }
//}









import SwiftUI
import Combine

struct AdminPanelView: View {
    @State private var email: String = ""
    @State private var accessCode: String = ""
    @State private var user: User?
    @State private var isLoading: Bool = false
    @State private var showUserSheet = false
    @State private var cancellable: AnyCancellable?
    @State private var updatedUser: User?

    var body: some View {
        ZStack {
            Image("splash")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)

            ScrollView {
                VStack {
                    Spacer(minLength: 50)
                    
                    VStack(alignment: .center) {
                        Text("Example Academy")
                            .font(.custom("Varsity", size: 25))
                            .foregroundColor(.white)
                            .padding(.top, 20)

                        Text("Admin Panel")
                            .font(.custom("Varsity", size: 80))
                            .foregroundColor(.white)
                            .padding(.bottom, 20)
                    }

                    VStack {
                        TextField("Enter user's email", text: $email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                            .font(.custom("Varsity", size: 18))
                            .autocapitalization(.none) // Disable auto-capitalization
                            .onChange(of: email) { newValue in
                                email = newValue.lowercased()
                            }

                        TextField("Enter access code", text: $accessCode)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                            .font(.custom("Varsity", size: 18))
                            .autocapitalization(.none) // Disable auto-capitalization
                            .onChange(of: accessCode) { newValue in
                                accessCode = newValue.lowercased()
                            }

                        Button("Search") {
                            isLoading = true
                            print("Searching for user with email: \(email) and access code: \(accessCode)")
                            fetchUserData(email: email, accessCode: accessCode)
                        }
                        .font(.custom("Varsity", size: 18))

                        if isLoading {
                            ProgressView("Loading...")
                        }

                        if let user = user {
                            UserView(user: Binding($user)!) // Pass the binding to UserView
                                .onReceive(Just(user)) { _ in
                                    print("User data updated in view.")
                                }
                        } else if !isLoading {
                            Text("No user data available or search not yet performed.")
                                .padding()
                        }

                    }
                    .padding(.horizontal)
                    Spacer()
                }
            }
            .sheet(isPresented: $showUserSheet) {
                if let user = user {
                    UserView(user: Binding($user)!)
                        .onReceive(Just(user)) { _ in
                            print("User data updated in view.")
                        }
                } else if !isLoading {
                    Text("No user data available or search not yet performed.")
                        .padding()
                }
            }
        }
    }

    func fetchUserData(email: String, accessCode: String) {
        let urlString = "http://54.197.82.22:8000/users?email=\(email)&accessCode=\(accessCode)"
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            self.isLoading = false
            return
        }

        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: User.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                self.isLoading = false
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error fetching user data: \(error.localizedDescription)")
                    self.user = nil
                }
            }, receiveValue: { user in
                self.user = user
                self.showUserSheet = true  // Show the sheet when data is fetched
            })
    }
}

struct UserView: View {
    @Binding var user: User

    var body: some View {
        List {
            Section(header: Text("USER INFO")
                        .font(.custom("Varsity", size: 25))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top, 10)) {
                ProfileRow(label: "Email", value: user.email)
                ProfileRow(label: "First Name", value: user.firstName)
                ProfileRow(label: "Last Name", value: user.lastName)
                ProfileRow(label: "Specialty", value: user.specialty)
                if let accessCode = user.accessCode {
                    ProfileRow(label: "Access Code", value: accessCode)
                }
            }
            Section(header: Text("IMAGES")
                        .font(.custom("Varsity", size: 25))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top, 10)) {
                if let profilePicture = user.profilePicture {
                    ImageRow(label: "Profile Picture", imageUrl: profilePicture, user: $user, field: "profilePicture")
                }
                if let image01 = user.image01 {
                    ImageRow(label: "Image 01", imageUrl: image01, user: $user, field: "image01")
                }
                if let image02 = user.image02 {
                    ImageRow(label: "Image 02", imageUrl: image02, user: $user, field: "image02")
                }
                if let image03 = user.image03 {
                    ImageRow(label: "Image 03", imageUrl: image03, user: $user, field: "image03")
                }
                if let image04 = user.image04 {
                    ImageRow(label: "Image 04", imageUrl: image04, user: $user, field: "image04")
                }
                if let image05 = user.image05 {
                    ImageRow(label: "Image 05", imageUrl: image05, user: $user, field: "image05")
                }
                if let image06 = user.image06 {
                    ImageRow(label: "Image 06", imageUrl: image06, user: $user, field: "image06")
                }
            }
            Section(header: Text("COMMENTS")
                        .font(.custom("Varsity", size: 25))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top, 10)) {
                if let comments = user.comments {
                    ForEach(comments.indices, id: \.self) { index in
                        CommentRow(comment: Binding(get: {
                            user.comments![index]
                        }, set: {
                            user.comments![index] = $0
                        }), userEmail: user.email)
                    }
                }
            }
        }
    }
}

struct ImageRow: View {
    let label: String
    let imageUrl: String
    @Binding var user: User
    let field: String

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: imageUrl)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                } else if phase.error != nil {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.gray)
                } else {
                    ProgressView()
                        .frame(width: 50, height: 50)
                }
            }
            Text("\(label)")
            Spacer()
            Button(action: {
                updateImageUrl()
            }) {
                Image(systemName: "trash")
                    .foregroundColor(.red)
            }
        }
        .font(.custom("Wildy", size: 18))
        .foregroundColor(.white)
        .padding()
        .background(Color.black)
        .cornerRadius(8)
    }

    func updateImageUrl() {
        guard let url = URL(string: "http://54.197.82.22:8000/updateImage") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let newImageUrl = "https://adayearbook1.s3.amazonaws.com/cs.jpg"
        let body: [String: Any] = [
            "email": user.email,
            "field": field,
            "newImageUrl": newImageUrl
        ]

        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error updating image URL:", error)
                return
            }

            if let data = data {
                if let updatedUser = try? JSONDecoder().decode(User.self, from: data) {
                    DispatchQueue.main.async {
                        self.user = updatedUser
                    }
                }
            }
        }.resume()
    }
}


struct CommentRow: View {
    @Binding var comment: Comment
    var userEmail: String  // Add this property

    var body: some View {
        HStack {
            Text(comment.comment)
                .foregroundColor(.white)
            Spacer()
            Button(action: {
                let oldComment = comment.comment
                comment.comment = "This comment has been removed"
                updateComment(email: userEmail, oldComment: oldComment, newComment: comment.comment)
            }) {
                Image(systemName: "trash")
                    .foregroundColor(.red)
            }
        }
        .padding()
        .background(Color.black)
        .font(.custom("Wildy", size: 17))
    }

    func updateComment(email: String, oldComment: String, newComment: String) {
        guard let url = URL(string: "http://54.197.82.22:8000/updateComment") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let body: [String: Any] = [
            "email": email,
            "oldComment": oldComment,
            "newComment": newComment
        ]

        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error updating comment:", error)
                return
            }

            if let data = data {
                if let updatedUser = try? JSONDecoder().decode(User.self, from: data) {
                    DispatchQueue.main.async {
                        // Update the user data if needed
                    }
                }
            }
        }.resume()
    }
}


struct ProfileRow: View {
    let label: String
    let value: String

    var body: some View {
        HStack {
            Text("\(label): \(value)")
                .foregroundColor(.white)
            Spacer()
        }
        .padding()
        .background(Color.black)
        .font(.custom("Wildy", size: 18))
    }
}


struct AdminPanelView_Previews: PreviewProvider {
    static var previews: some View {
        AdminPanelView()
    }
}

//












//import SwiftUI
//import Combine
//
//struct AdminPanelView: View {
//    @State private var email: String = ""
//    @State private var accessCode: String = ""
//    @State private var user: User?
//    @State private var isLoading: Bool = false
//    @State private var showUserSheet = false
//    @State private var cancellable: AnyCancellable?
//    @State private var updatedUser: User?
//
//    var body: some View {
//        ZStack {
//            Image("splash")
//                .resizable()
//                .scaledToFill()
//                .edgesIgnoringSafeArea(.all)
//
//            ScrollView {
//                VStack {
//                    Spacer(minLength: 50)
//                    
//                    VStack(alignment: .center) {
//                        Text("Example Academy")
//                            .font(.custom("Varsity", size: 25))
//                            .foregroundColor(.white)
//                            .padding(.top, 20)
//
//                        Text("Admin Panel")
//                            .font(.custom("Varsity", size: 80))
//                            .foregroundColor(.white)
//                            .padding(.bottom, 20)
//                    }
//
//                    VStack {
//                        TextField("Enter user's email", text: $email)
//                            .textFieldStyle(RoundedBorderTextFieldStyle())
//                            .padding()
//                            .font(.custom("Varsity", size: 18))
//                            .autocapitalization(.none) // Disable auto-capitalization
//                            .onChange(of: email) { newValue in
//                                email = newValue.lowercased()
//                            }
//
//                        TextField("Enter access code", text: $accessCode)
//                            .textFieldStyle(RoundedBorderTextFieldStyle())
//                            .padding()
//                            .font(.custom("Varsity", size: 18))
//                            .autocapitalization(.none) // Disable auto-capitalization
//                            .onChange(of: accessCode) { newValue in
//                                accessCode = newValue.lowercased()
//                            }
//
//                        Button("Search") {
//                            isLoading = true
//                            print("Searching for user with email: \(email) and access code: \(accessCode)")
//                            fetchUserData(email: email, accessCode: accessCode)
//                        }
//                        .font(.custom("Varsity", size: 18))
//
//                        if isLoading {
//                            ProgressView("Loading...")
//                        }
//
//                        if let user = user {
//                            UserView(user: Binding($user)!) // Pass the binding to UserView
//                                .onReceive(Just(user)) { _ in
//                                    print("User data updated in view.")
//                                }
//                        } else if !isLoading {
//                            Text("No user data available or search not yet performed.")
//                                .padding()
//                        }
//
//                    }
//                    .padding(.horizontal)
//                    Spacer()
//                }
//            }
//            .sheet(isPresented: $showUserSheet) {
//                if let user = user {
//                    UserView(user: Binding($user)!)
//                        .onReceive(Just(user)) { _ in
//                            print("User data updated in view.")
//                        }
//                        .background(Color.black.edgesIgnoringSafeArea(.all))
//                        .foregroundColor(.white)
//                } else if !isLoading {
//                    Text("No user data available or search not yet performed.")
//                        .padding()
//                        .background(Color.black.edgesIgnoringSafeArea(.all))
//                        .foregroundColor(.white)
//                }
//            }
//        }
//    }
//
//    func fetchUserData(email: String, accessCode: String) {
//        let urlString = "http://54.197.82.22:8000/users?email=\(email)&accessCode=\(accessCode)"
//        guard let url = URL(string: urlString) else {
//            print("Invalid URL")
//            self.isLoading = false
//            return
//        }
//
//        cancellable = URLSession.shared.dataTaskPublisher(for: url)
//            .map { $0.data }
//            .decode(type: User.self, decoder: JSONDecoder())
//            .receive(on: DispatchQueue.main)
//            .sink(receiveCompletion: { completion in
//                self.isLoading = false
//                switch completion {
//                case .finished:
//                    break
//                case .failure(let error):
//                    print("Error fetching user data: \(error.localizedDescription)")
//                    self.user = nil
//                }
//            }, receiveValue: { user in
//                self.user = user
//                self.showUserSheet = true  // Show the sheet when data is fetched
//            })
//    }
//}
//
//struct UserView: View {
//    @Binding var user: User
//
//    var body: some View {
//        List {
//            Section(header: Text("USER INFO")
//                        .font(.custom("Varsity", size: 25))
//                        .padding(.top, 10)) {
//                ProfileRow(label: "Email", value: user.email)
//                ProfileRow(label: "First Name", value: user.firstName)
//                ProfileRow(label: "Last Name", value: user.lastName)
//                ProfileRow(label: "Specialty", value: user.specialty)
//                if let accessCode = user.accessCode {
//                    ProfileRow(label: "Access Code", value: accessCode)
//                }
//            }
//            Section(header: Text("IMAGES")
//                        .font(.custom("Varsity", size: 25))
//                        .padding(.top, 10)) {
//                if let profilePicture = user.profilePicture {
//                    ImageRow(label: "Profile Picture", imageUrl: profilePicture, user: $user, field: "profilePicture")
//                }
//                if let image01 = user.image01 {
//                    ImageRow(label: "Image 01", imageUrl: image01, user: $user, field: "image01")
//                }
//                if let image02 = user.image02 {
//                    ImageRow(label: "Image 02", imageUrl: image02, user: $user, field: "image02")
//                }
//                if let image03 = user.image03 {
//                    ImageRow(label: "Image 03", imageUrl: image03, user: $user, field: "image03")
//                }
//                if let image04 = user.image04 {
//                    ImageRow(label: "Image 04", imageUrl: image04, user: $user, field: "image04")
//                }
//                if let image05 = user.image05 {
//                    ImageRow(label: "Image 05", imageUrl: image05, user: $user, field: "image05")
//                }
//                if let image06 = user.image06 {
//                    ImageRow(label: "Image 06", imageUrl: image06, user: $user, field: "image06")
//                }
//            }
//            Section(header: Text("COMMENTS")
//                        .font(.custom("Varsity", size: 25))
//                        .padding(.top, 10)) {
//                if let comments = user.comments {
//                    ForEach(comments.indices, id: \.self) { index in
//                        CommentRow(comment: Binding(get: {
//                            user.comments![index]
//                        }, set: {
//                            user.comments![index] = $0
//                        }), userEmail: user.email)
//                    }
//                }
//            }
//        }
//        .background(Color.black)
//        .foregroundColor(.white)
//        .listStyle(GroupedListStyle())
//    }
//}
//
//struct ImageRow: View {
//    let label: String
//    let imageUrl: String
//    @Binding var user: User
//    let field: String
//
//    var body: some View {
//        HStack {
//            AsyncImage(url: URL(string: imageUrl)) { phase in
//                if let image = phase.image {
//                    image
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 50, height: 50)
//                        .clipShape(Circle())
//                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
//                } else if phase.error != nil {
//                    Image(systemName: "photo")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 50, height: 50)
//                        .foregroundColor(.gray)
//                } else {
//                    ProgressView()
//                        .frame(width: 50, height: 50)
//                }
//            }
//            Text("\(label)")
//            Spacer()
//            Button(action: {
//                updateImageUrl()
//            }) {
//                Image(systemName: "trash")
//                    .foregroundColor(.red)
//            }
//        }
//        .font(.custom("Varsity", size: 18))
//    }
//
//    func updateImageUrl() {
//        guard let url = URL(string: "http://54.197.82.22:8000/updateImage") else { return }
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        let newImageUrl = "https://adayearbook1.s3.amazonaws.com/cs.jpg"
//        let body: [String: Any] = [
//            "email": user.email,
//            "field": field,
//            "newImageUrl": newImageUrl
//        ]
//
//        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let error = error {
//                print("Error updating image URL:", error)
//                return
//            }
//
//            if let data = data {
//                if let updatedUser = try? JSONDecoder().decode(User.self, from: data) {
//                    DispatchQueue.main.async {
//                        self.user = updatedUser
//                    }
//                }
//            }
//        }.resume()
//    }
//}
//
//struct CommentRow: View {
//    @Binding var comment: Comment
//    var userEmail: String  // Add this property
//
//    var body: some View {
//        HStack {
//            Text(comment.comment)
//            Spacer()
//            Button(action: {
//                let oldComment = comment.comment
//                comment.comment = "This comment has been removed"
//                updateComment(email: userEmail, oldComment: oldComment, newComment: comment.comment)
//            }) {
//                Image(systemName: "trash")
//                    .foregroundColor(.red)
//            }
//        }
//        .font(.custom("Varsity", size: 17))
//    }
//
//    func updateComment(email: String, oldComment: String, newComment: String) {
//        guard let url = URL(string: "http://54.197.82.22:8000/updateComment") else { return }
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        let body: [String: Any] = [
//            "email": email,
//            "oldComment": oldComment,
//            "newComment": newComment
//        ]
//
//        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let error = error {
//                print("Error updating comment:", error)
//                return
//            }
//
//            if let data = data {
//                if let updatedUser = try? JSONDecoder().decode(User.self, from: data) {
//                    DispatchQueue.main.async {
//                        // Update the user data if needed
//                    }
//                }
//            }
//        }.resume()
//    }
//}
//
//struct ProfileRow: View {
//    let label: String
//    let value: String
//
//    var body: some View {
//        HStack {
//            Text("\(label): \(value)")
//            Spacer()
//        }
//        .font(.custom("Varsity", size: 18))
//    }
//}
//
//struct AdminPanelView_Previews: PreviewProvider {
//    static var previews: some View {
//        AdminPanelView()
//    }
//}
