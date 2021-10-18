//
//  ContentView.swift
//  PopToRootViewExample
//
//  Created by Russell Gordon on 2021-10-18.
//

import SwiftUI

struct ContentView: View {
    @State var isActive : Bool = false

    var body: some View {
        NavigationView {
            NavigationLink(destination: ContentView2(rootIsActive: $isActive),
                           isActive: $isActive) {
                Text("Hello, World!")
            }
            .isDetailLink(false)
            .navigationBarTitle("Root")
        }
    }
}

struct ContentView2: View {
    @Binding var rootIsActive : Bool

    var body: some View {
        NavigationLink(destination: ContentView3(rootIsActive: $rootIsActive)) {
            Text("Hello, World #2!")
        }
        .isDetailLink(false)
        .navigationBarTitle("Two")
        .onAppear {
            print("root is active?: \(rootIsActive)")
        }
    }
}

struct ContentView3: View {
    @Binding var rootIsActive : Bool

    var body: some View {
        VStack {
            Text("Hello, World #3!")
            Button(action: {
                rootIsActive = false
                print("root is active?: \(rootIsActive)")
            }, label: {
                Text("Pop to root")
            })
        }
        .navigationBarTitle("Three")
        .onAppear {
            print("root is active?: \(rootIsActive)")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
