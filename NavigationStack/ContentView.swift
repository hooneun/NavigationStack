//
//  ContentView.swift
//  NavigationStack
//
//  Created by Hoon on 5/29/24.
//

import SwiftUI

struct ContentView: View {
    let appleProducts = ["iPhone", "iPad", "Mac", "Apple Watch", "Apple TV"]
//    @State private var stackPath: [String] = []
    @State private var stackPath: NavigationPath = .init()

    var body: some View {
        NavigationStack(path: $stackPath) {
            List(appleProducts, id: \.self) { product in
                // NavigationLink Used
                NavigationLink(value: product) {
                    Text(product)
                }

                // Button Used
//                Button {
//                    stackPath.append(product)
//                } label: {
//                    Text(product)
//                        .font(.largeTitle)
//                        .bold()
//                }
            }
            .navigationTitle("네비게이션 스택")
            .navigationDestination(for: String.self) { product in
                Text("\(product) has clicked")
            }
            .navigationDestination(for: Int.self) { _ in
                Text("넘버가 선택되었습니다.")
            }

            Button {
                stackPath.append(1)
            } label: {
                Text("Number 네비게이선")
                    .font(.largeTitle)
                    .bold()
            }
        }
    }
}

#Preview {
    ContentView()
}
