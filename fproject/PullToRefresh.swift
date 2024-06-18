import SwiftUI

struct PullToRefresh: View {
    var coordinateSpaceName: String
    @Binding var isRefreshing: Bool
    var onRefresh: () -> Void

    var body: some View {
        GeometryReader { geometry in
            if geometry.frame(in: .named(coordinateSpaceName)).minY > 50 {
                Spacer()
                    .onAppear {
                        if !isRefreshing {
                            isRefreshing = true
                            onRefresh()
                        }
                    }
            } else if geometry.frame(in: .named(coordinateSpaceName)).maxY < 20 {
                Spacer()
                    .onAppear {
                        if isRefreshing {
                            isRefreshing = false
                        }
                    }
            }
            Color.clear
        }
    }
}

