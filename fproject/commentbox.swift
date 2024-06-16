import SwiftUI

struct commentbox: View {
    @State private var commentText: String = ""
    @State private var comments: [String] = []

    var body: some View {
        VStack {
           
            VStack {
                ZStack {
                   // Color.white // Set the background color to white

                    TextField("", text: $commentText)
                        .font(.custom("winter wind", size: 28))
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(width: 343, height: 106)
                        .background(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color.black)  // Ensure the stroke color is visible
                        )
                        .background(Color.black) // Ensure the TextField itself has a clear background

                    if commentText.isEmpty {
                        Text("Sign my yearbook...")
                            .font(.custom("winter wind", size: 40, relativeTo: .subheadline))
                            .foregroundColor(Color.black)
                            .padding(.horizontal)
                            .frame(width: 343, height: 106, alignment: .leading) // Ensure the placeholder has the same frame
                    }
                }
            
            

                Button(action: {
                  
                    if !commentText.isEmpty {
                        comments.append(commentText)
                        commentText = ""
                    }
                }) {
                    Text("Confirm")
                        .font(.custom("Helvetica", size: 12))
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)                        .frame(width: 176, height: 34)
                        .multilineTextAlignment(.center)
                        .background(Color.white)
                        .foregroundColor(.black)                        .cornerRadius(4)                 }
                .padding(.trailing)
            }
            .padding()

            
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(comments, id: \.self) { comment in
                        Text(comment)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                            .padding(.horizontal)
                    }
                }
            }
            .padding(.top)
        }
    }
}

extension View {
    func placeholder<Content: View>(when shouldShow: Bool, alignment: Alignment = .leading, @ViewBuilder placeholder: () -> Content) -> some View {
        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}

#Preview {
    commentbox()
}

