//import SwiftUI
//
//struct SearchView: View {
//    @StateObject private var viewModel = SearchViewModel()
//    @State private var searchText: String = ""
//    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                HStack {
//                    Button(action: {
//                        self.presentationMode.wrappedValue.dismiss()
//                    }) {
//                        HStack {
//                            Image(systemName: "arrow.left")
//                            Text("Back")
//                        }
//                        .foregroundColor(.blue)
//                    }
//                    .padding()
////                    
////                    Spacer()
////                    
////                    Text("Search for Classmates")
////                        .font(.headline)
////                        .foregroundColor(.blue)
////                        .padding()
////                    
////                    Spacer()
////                    
//                    Button(action: {
//                        viewModel.searchUsers(firstName: searchText, lastName: "")
//                    }) {
//                        Text("Search")
//                            .font(.headline)
//                            .foregroundColor(.white)
//                            .padding()
//                            .background(Color.blue)
//                            .cornerRadius(10)
//                    }
//                    .padding()
//                }
//                
//                TextField("", text: $searchText)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .padding()
//                
//                List(viewModel.searchResults) { user in
//                    NavigationLink(destination: UserProfileViewAlt(user: user)) {
//                        HStack {
//                            if let urlString = user.profilePicture, let url = URL(string: urlString) {
//                                AsyncImage(url: url) { image in
//                                    image.resizable()
//                                        .aspectRatio(contentMode: .fill)
//                                        .frame(width: 50, height: 50)
//                                        .clipShape(Circle())
//                                } placeholder: {
//                                    Image(systemName: "person.crop.circle.fill")
//                                        .resizable()
//                                        .aspectRatio(contentMode: .fill)
//                                        .frame(width: 50, height: 50)
//                                        .foregroundColor(.gray)
//                                }
//                            } else {
//                                Image(systemName: "person.crop.circle.fill")
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fill)
//                                    .frame(width: 50, height: 50)
//                                    .foregroundColor(.gray)
//                            }
//                            
//                            VStack(alignment: .leading) {
//                                Text(user.firstName + " " + user.lastName)
//                                    .font(.headline)
//                                Text(user.specialty)
//                                    .font(.subheadline)
//                                    .foregroundColor(.gray)
//                            }
//                            Spacer()
//                        }
//                        .padding()
//                    }
//                }
//                .searchable(text: $searchText)
////                .navigationTitle("Search")
//                .navigationBarTitleDisplayMode(.inline)
//            }
//        }
//    }
//}
//
//class SearchViewModel: ObservableObject {
//    @Published var searchResults: [User] = []
//
//    func searchUsers(firstName: String, lastName: String) {
//        var components = URLComponents(string: "http://54.197.82.22:8000/search")!
//        var queryItems = [URLQueryItem]()
//        if !firstName.isEmpty {
//            queryItems.append(URLQueryItem(name: "firstName", value: firstName))
//        }
//        if !lastName.isEmpty {
//            queryItems.append(URLQueryItem(name: "lastName", value: lastName))
//        }
//        components.queryItems = queryItems
//
//        guard let url = components.url else { return }
//
//        let request = URLRequest(url: url)
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let data = data {
//                if let users = try? JSONDecoder().decode([User].self, from: data) {
//                    DispatchQueue.main.async {
//                        self.searchResults = users
//                    }
//                }
//            }
//        }.resume()
//    }
//}
//
//
//
//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchView()
//    }
//}




//import SwiftUI
//
//struct SearchView: View {
//    @StateObject private var viewModel = SearchViewModel()
//    @State private var searchText: String = ""
//    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
//
//    var body: some View {
//        NavigationView {
//            ZStack {
//                Color.black.edgesIgnoringSafeArea(.all)
//                
//                VStack {
//                    Spacer()
//                    Image("gridMe")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(maxHeight: 200)
//                        .padding(.bottom, 10)
//                }
//                
//                VStack {
//                    TextField("Search", text: $searchText)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .padding()
//                    
//                    Button(action: {
//                        viewModel.searchUsers(firstName: searchText, lastName: "")
//                    }) {
//                        Text("Search")
//                            .font(.headline)
//                            .foregroundColor(.white)
//                            .padding()
//                            .background(Color.blue)
//                            .cornerRadius(10)
//                    }
//                    .padding()
//                    
//                    List(viewModel.searchResults) { user in
//                        NavigationLink(destination: UserProfileViewAlt(user: user)) {
//                            HStack {
//                                if let urlString = user.profilePicture, let url = URL(string: urlString) {
//                                    AsyncImage(url: url) { image in
//                                        image.resizable()
//                                            .aspectRatio(contentMode: .fill)
//                                            .frame(width: 50, height: 50)
//                                            .clipShape(Circle())
//                                    } placeholder: {
//                                        Image(systemName: "person.crop.circle.fill")
//                                            .resizable()
//                                            .aspectRatio(contentMode: .fill)
//                                            .frame(width: 50, height: 50)
//                                            .foregroundColor(.gray)
//                                    }
//                                } else {
//                                    Image(systemName: "person.crop.circle.fill")
//                                        .resizable()
//                                        .aspectRatio(contentMode: .fill)
//                                        .frame(width: 50, height: 50)
//                                        .foregroundColor(.gray)
//                                }
//                                
//                                VStack(alignment: .leading) {
//                                    Text(user.firstName + " " + user.lastName)
//                                        .font(.headline)
//                                    Text(user.specialty)
//                                        .font(.subheadline)
//                                        .foregroundColor(.gray)
//                                }
//                                Spacer()
//                            }
//                            .padding()
//                        }
//                    }
//                    .searchable(text: $searchText)
//                }
//            }
//            .navigationTitle("Search")
//            .navigationBarTitleDisplayMode(.inline)
//            .navigationBarHidden(true)
//        }
//    }
//}
//
//class SearchViewModel: ObservableObject {
//    @Published var searchResults: [User] = []
//
//    func searchUsers(firstName: String, lastName: String) {
//        var components = URLComponents(string: "http://54.197.82.22:8000/search")!
//        var queryItems = [URLQueryItem]()
//        if !firstName.isEmpty {
//            queryItems.append(URLQueryItem(name: "firstName", value: firstName))
//        }
//        if !lastName.isEmpty {
//            queryItems.append(URLQueryItem(name: "lastName", value: lastName))
//        }
//        components.queryItems = queryItems
//
//        guard let url = components.url else { return }
//
//        let request = URLRequest(url: url)
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let data = data {
//                if let users = try? JSONDecoder().decode([User].self, from: data) {
//                    DispatchQueue.main.async {
//                        self.searchResults = users
//                    }
//                }
//            }
//        }.resume()
//    }
//}
//
//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchView()
//    }
//}







//import SwiftUI
//
//struct SearchView: View {
//    @StateObject private var viewModel = SearchViewModel()
//    @State private var searchText: String = ""
//    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
//
//    var body: some View {
//        NavigationView {
//            ZStack {
//                Image("SearchBackground")
//                    .resizable()
//                    .scaledToFill()
//                    .edgesIgnoringSafeArea(.all)
//
//                VStack {
//                    TextField("Search", text: $searchText)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .padding()
//                    
//                    Button(action: {
//                        viewModel.searchUsers(firstName: searchText, lastName: "")
//                    }) {
//                        Text("Search")
//                            .font(.headline)
//                            .foregroundColor(.white)
//                            .padding()
//                            .background(Color.blue)
//                            .cornerRadius(10)
//                    }
//                    .padding()
//                    
//                    List(viewModel.searchResults) { user in
//                        NavigationLink(destination: UserProfileViewAlt(user: user)) {
//                            HStack {
//                                if let urlString = user.profilePicture, let url = URL(string: urlString) {
//                                    AsyncImage(url: url) { image in
//                                        image.resizable()
//                                            .aspectRatio(contentMode: .fill)
//                                            .frame(width: 50, height: 50)
//                                            .clipShape(Circle())
//                                    } placeholder: {
//                                        Image(systemName: "person.crop.circle.fill")
//                                            .resizable()
//                                            .aspectRatio(contentMode: .fill)
//                                            .frame(width: 50, height: 50)
//                                            .foregroundColor(.gray)
//                                    }
//                                } else {
//                                    Image(systemName: "person.crop.circle.fill")
//                                        .resizable()
//                                        .aspectRatio(contentMode: .fill)
//                                        .frame(width: 50, height: 50)
//                                        .foregroundColor(.gray)
//                                }
//                                
//                                VStack(alignment: .leading) {
//                                    Text(user.firstName + " " + user.lastName)
//                                        .font(.headline)
//                                    Text(user.specialty)
//                                        .font(.subheadline)
//                                        .foregroundColor(.gray)
//                                }
//                                Spacer()
//                            }
//                            .padding()
//                        }
//                    }
//                    .searchable(text: $searchText)
//                }
//                .padding()
//            }
//            .navigationTitle("Search")
//            .navigationBarTitleDisplayMode(.inline)
//            .navigationBarHidden(true)
//        }
//    }
//}
//
//class SearchViewModel: ObservableObject {
//    @Published var searchResults: [User] = []
//
//    func searchUsers(firstName: String, lastName: String) {
//        var components = URLComponents(string: "http://54.197.82.22:8000/search")!
//        var queryItems = [URLQueryItem]()
//        if !firstName.isEmpty {
//            queryItems.append(URLQueryItem(name: "firstName", value: firstName))
//        }
//        if !lastName.isEmpty {
//            queryItems.append(URLQueryItem(name: "lastName", value: lastName))
//        }
//        components.queryItems = queryItems
//
//        guard let url = components.url else { return }
//
//        let request = URLRequest(url: url)
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let data = data {
//                if let users = try? JSONDecoder().decode([User].self, from: data) {
//                    DispatchQueue.main.async {
//                        self.searchResults = users
//                    }
//                }
//            }
//        }.resume()
//    }
//}
//
//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchView()
//    }
//}





//import SwiftUI
//
//struct SearchView: View {
//    @StateObject private var viewModel = SearchViewModel()
//    @State private var searchText: String = ""
//    @State private var showResults = false
//    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
//
//    var body: some View {
//        NavigationView {
//            ZStack {
//                Image("SearchBackground")
//                    .resizable()
//                    .scaledToFill()
//                    .edgesIgnoringSafeArea(.all)
//
//                VStack {
//                    TextField("Search", text: $searchText)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .padding()
////                        .background(Color.white.opacity(0.8))
//                        .cornerRadius(10)
//                        .padding(.horizontal, 20)
//                        .padding(.top, 60)
//
//                    Button(action: {
//                        viewModel.searchUsers(firstName: searchText, lastName: "")
//                        showResults = true
//                    }) {
//                        Text("Search")
//                            .font(.headline)
//                            .foregroundColor(.white)
//                            .padding()
//                            .background(Color.blue)
//                            .cornerRadius(10)
//                    }
//                    .padding()
//
//                    Spacer()
//                }
//                .padding()
//            }
//            .navigationTitle("Search")
//            .navigationBarTitleDisplayMode(.inline)
//            .navigationBarHidden(true)
//            .sheet(isPresented: $showResults) {
//                ResultsView(viewModel: viewModel)
//            }
//        }
//    }
//}
//
//struct ResultsView: View {
//    @ObservedObject var viewModel: SearchViewModel
//    @Environment(\.presentationMode) var presentationMode
//
//    var body: some View {
//        NavigationView {
//            List(viewModel.searchResults) { user in
//                NavigationLink(destination: UserProfileViewAlt(user: user)) {
//                    HStack {
//                        if let urlString = user.profilePicture, let url = URL(string: urlString) {
//                            AsyncImage(url: url) { image in
//                                image.resizable()
//                                    .aspectRatio(contentMode: .fill)
//                                    .frame(width: 50, height: 50)
//                                    .clipShape(Circle())
//                            } placeholder: {
//                                Image(systemName: "person.crop.circle.fill")
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fill)
//                                    .frame(width: 50, height: 50)
//                                    .foregroundColor(.gray)
//                            }
//                        } else {
//                            Image(systemName: "person.crop.circle.fill")
//                                .resizable()
//                                .aspectRatio(contentMode: .fill)
//                                .frame(width: 50, height: 50)
//                                .foregroundColor(.gray)
//                        }
//                        
//                        VStack(alignment: .leading) {
//                            Text(user.firstName + " " + user.lastName)
//                                .font(.headline)
//                            Text(user.specialty)
//                                .font(.subheadline)
//                                .foregroundColor(.gray)
//                        }
//                        Spacer()
//                    }
//                    .padding()
//                }
//            }
//            .navigationTitle("Results")
//            .navigationBarItems(trailing: Button("Done") {
//                presentationMode.wrappedValue.dismiss()
//            })
//        }
//    }
//}
//
//class SearchViewModel: ObservableObject {
//    @Published var searchResults: [User] = []
//
//    func searchUsers(firstName: String, lastName: String) {
//        var components = URLComponents(string: "http://54.197.82.22:8000/search")!
//        var queryItems = [URLQueryItem]()
//        if !firstName.isEmpty {
//            queryItems.append(URLQueryItem(name: "firstName", value: firstName))
//        }
//        if !lastName.isEmpty {
//            queryItems.append(URLQueryItem(name: "lastName", value: lastName))
//        }
//        components.queryItems = queryItems
//
//        guard let url = components.url else { return }
//
//        let request = URLRequest(url: url)
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let data = data {
//                if let users = try? JSONDecoder().decode([User].self, from: data) {
//                    DispatchQueue.main.async {
//                        self.searchResults = users
//                    }
//                }
//            }
//        }.resume()
//    }
//}
//
//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchView()
//    }
//}








//import SwiftUI
//
//struct SearchView: View {
//    @StateObject private var viewModel = SearchViewModel()
//    @State private var searchText: String = ""
//    @State private var showResults = false
//    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
//
//    var body: some View {
//        NavigationView {
//            ZStack {
//                Image("SearchBackground")
//                    .resizable()
//                    .scaledToFill()
//                    .edgesIgnoringSafeArea(.all)
//
//                VStack {
//                    HStack {
//                        TextField("Search", text: $searchText)
//                            .textFieldStyle(PlainTextFieldStyle())
//                            .padding(10)
//                            .background(Color.white.opacity(0.8))
//                            .cornerRadius(10)
//                            .padding(.leading, 20)
//
//                        Button(action: {
//                            viewModel.searchUsers(firstName: searchText, lastName: "")
//                            showResults = true
//                        }) {
//                            Image(systemName: "magnifyingglass")
//                                .foregroundColor(.gray)
//                                .padding(10)
////                                .background(Color.blue)
//                                .cornerRadius(10)
//                        }
//                        .padding(.trailing, 20)
//                    }
//                    .padding(.top, 60)
//                    
//                    Spacer()
//                }
//                .padding()
//            }
//            .navigationTitle("Search")
//            .navigationBarTitleDisplayMode(.inline)
//            .navigationBarHidden(true)
//            .sheet(isPresented: $showResults) {
//                ResultsView(viewModel: viewModel)
//            }
//        }
//    }
//}
//
//struct ResultsView: View {
//    @ObservedObject var viewModel: SearchViewModel
//    @Environment(\.presentationMode) var presentationMode
//
//    var body: some View {
//        NavigationView {
//            List(viewModel.searchResults) { user in
//                NavigationLink(destination: UserProfileViewAlt(user: user)) {
//                    HStack {
//                        if let urlString = user.profilePicture, let url = URL(string: urlString) {
//                            AsyncImage(url: url) { image in
//                                image.resizable()
//                                    .aspectRatio(contentMode: .fill)
//                                    .frame(width: 50, height: 50)
//                                    .clipShape(Circle())
//                            } placeholder: {
//                                Image(systemName: "person.crop.circle.fill")
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fill)
//                                    .frame(width: 50, height: 50)
//                                    .foregroundColor(.gray)
//                            }
//                        } else {
//                            Image(systemName: "person.crop.circle.fill")
//                                .resizable()
//                                .aspectRatio(contentMode: .fill)
//                                .frame(width: 50, height: 50)
//                                .foregroundColor(.gray)
//                        }
//                        
//                        VStack(alignment: .leading) {
//                            Text(user.firstName + " " + user.lastName)
//                                .font(.headline)
//                            Text(user.specialty)
//                                .font(.subheadline)
//                                .foregroundColor(.gray)
//                        }
//                        Spacer()
//                    }
//                    .padding()
//                }
//            }
//            .navigationTitle("Results")
//            .navigationBarItems(trailing: Button("Done") {
//                presentationMode.wrappedValue.dismiss()
//            })
//        }
//    }
//}
//
//class SearchViewModel: ObservableObject {
//    @Published var searchResults: [User] = []
//
//    func searchUsers(firstName: String, lastName: String) {
//        var components = URLComponents(string: "http://54.197.82.22:8000/search")!
//        var queryItems = [URLQueryItem]()
//        if !firstName.isEmpty {
//            queryItems.append(URLQueryItem(name: "firstName", value: firstName))
//        }
//        if !lastName.isEmpty {
//            queryItems.append(URLQueryItem(name: "lastName", value: lastName))
//        }
//        components.queryItems = queryItems
//
//        guard let url = components.url else { return }
//
//        let request = URLRequest(url: url)
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let data = data {
//                if let users = try? JSONDecoder().decode([User].self, from: data) {
//                    DispatchQueue.main.async {
//                        self.searchResults = users
//                    }
//                }
//            }
//        }.resume()
//    }
//}
//
//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchView()
//    }
//}









import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = SearchViewModel()
    @State private var searchText: String = ""
    @State private var showResults = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        NavigationView {
            ZStack {
                Image("SearchBackground")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    HStack {
                        TextField("Search", text: $searchText)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding(10)
                            .background(Color.white.opacity(0.8))
                            .cornerRadius(10)
                            .padding(.leading, 20)
                            .overlay(
                                HStack {
                                    Spacer()
                                    Button(action: {
                                        viewModel.searchUsers(firstName: searchText, lastName: "")
                                        showResults = true
                                    }) {
                                        Image(systemName: "magnifyingglass")
                                            .foregroundColor(.gray)
                                            .padding()
                                    }
                                }
                                .padding(.trailing, 10)
                            )
                    }
                    .padding(.top, 60)

                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
            .sheet(isPresented: $showResults) {
                ResultsView(viewModel: viewModel)
            }
        }
    }
}

struct ResultsView: View {
    @ObservedObject var viewModel: SearchViewModel
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            List(viewModel.searchResults) { user in
                NavigationLink(destination: UserProfileViewAlt(user: user)) {
                    HStack {
                        if let urlString = user.profilePicture, let url = URL(string: urlString) {
                            AsyncImage(url: url) { image in
                                image.resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 50, height: 50)
                                    .clipShape(Circle())
                            } placeholder: {
                                Image(systemName: "person.crop.circle.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.gray)
                            }
                        } else {
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 50, height: 50)
                                .foregroundColor(.gray)
                        }
                        
                        VStack(alignment: .leading) {
                            Text(user.firstName + " " + user.lastName)
                                .font(.headline)
                            Text(user.specialty)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                    }
                    .padding()
                }
            }
            .navigationTitle("Results")
            .navigationBarItems(trailing: Button("Done") {
                presentationMode.wrappedValue.dismiss()
            })
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
