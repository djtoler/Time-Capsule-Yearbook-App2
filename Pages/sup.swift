import SwiftUI

struct sup: View {
    var categoriesL: [Superlative] = [
        Superlative(title: "MOST SOCIAL", imageLink: "https://adayearbook1.s3.amazonaws.com/social.JPG"),
        Superlative(title: "BEST DRESSED", imageLink: "https://adayearbook1.s3.amazonaws.com/bestdressed.jpg"),
        Superlative(title: "MOST HELPFUL", imageLink: "https://adayearbook1.s3.amazonaws.com/mosthelpful.png"),
        Superlative(title: "MOST LIKELY TO BE LATE FOR GRADUATION", imageLink: "https://adayearbook1.s3.amazonaws.com/late.png"),
        Superlative(title: "BEST PROJECT MANAGER", imageLink: "https://adayearbook1.s3.amazonaws.com/bestpm.jpg"),
        Superlative(title: "BEST CODER", imageLink: "https://adayearbook1.s3.amazonaws.com/bestcoder1.jpg")
    ]
    
    var categoriesR: [Superlative] = [
        Superlative(title: "CLASS COMEDIAN", imageLink: "https://adayearbook1.s3.amazonaws.com/comedian.jpg"),
        Superlative(title: "MOST LIKELY TO TALK ON THE MIC", imageLink: "https://adayearbook1.s3.amazonaws.com/talkonmic.jpeg"),
        Superlative(title: "MOST LIKELY TO CREATE A GROUNDBREAKING APP", imageLink: "https://adayearbook1.s3.amazonaws.com/gbapp.png"),
        Superlative(title: "BEST MENTOR", imageLink: "https://adayearbook1.s3.amazonaws.com/bestmentor.png"),
        Superlative(title: "BEST DESIGNER", imageLink: "https://adayearbook1.s3.amazonaws.com/bestdesigner.jpeg")
    ]

    var body: some View {
        ZStack {
            Image("blackBackground")
                .resizable()
                .ignoresSafeArea()
            ScrollView {
                VStack {
                    Image("CLASS1")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .padding(.top, 20)
                    Text("SUPERLATIVES")
                        .font(.custom("varsity", size: 35, relativeTo: .title))
                        .foregroundStyle(.blue)
                    HStack {
                        VStack {
                            ForEach(0..<categoriesL.count, id: \.self) { index in
                                CategoryView2(categoryTitle: categoriesL[index])
                            }
                        }
                        VStack {
                            ForEach(0..<categoriesR.count, id: \.self) { index in
                                CategoryView2(categoryTitle: categoriesR[index])
                            }
                        }
                    }
                    Image("gridMe")
                        .resizable()
                }
            }
        }
    }
}

struct CategoryView2: View {
    var categoryTitle: Superlative

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: categoryTitle.imageLink)) { image in
                image.resizable()
                    .aspectRatio(1, contentMode: .fill)
                    .frame(width: 200, height: 200)
                    .clipped()
                    .overlay(
                        Rectangle()
                            .stroke(Color.white, lineWidth: 2)
                    )
            } placeholder: {
                ProgressView()
                    .frame(width: 200, height: 200)
                    .overlay(
                        Rectangle()
                            .stroke(Color.white, lineWidth: 2)
                    )
            }
            Text(categoryTitle.title)
                .font(.custom("varsity", size: 18))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}




struct sup_Previews: PreviewProvider {
    static var previews: some View {
        sup()
    }
}

