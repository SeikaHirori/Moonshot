//
//  ContentView.swift
//  Moonshot
//
//  Created by Seika Hirori on 4/9/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        lesson_section_1_5()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct lesson_section_1_2: View {
    var body: some View {
       return VStack{
           Text("hello world")
           
           GeometryReader { geo in
               Image("Example")
                   .resizable()
                   .scaledToFit()
                   .frame(width: geo.size.width * 0.8)
                   .frame(width: geo.size.width, height: geo.size.height) // This centers the image
    
           }
       }
    }
}


struct lesson_section_1_3: View {
    var body: some View {
        return ScrollView(.horizontal) {
            LazyHStack {
                ForEach(0..<100) {
                    CustomText("Item \($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
    
}

struct CustomText: View {
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    init(_ text: String) {
        print("Creating a new CustomText with \(text)")
        self.text = text
    }
}

struct lesson_section_1_4: View {
    var body: some View {
        return NavigationStack {
            List(0..<100) { row in
                NavigationLink {
                    Text("Detail \(row)")
                } label: {
                    Text("Row \(row)")
                }
            }
            .navigationTitle("SwiftUI")
        }
    }
}

struct lesson_section_1_5: View {
    var body: some View {
        return LazyVStack {
            Button("Decode JSON") {
                let input: String = """
{
    "name": "Taylor Swift",
    "address": {
        "street": "555, Taylor Swift Avenue",
        "city": "Nashville"
    }
}
"""
            }
        }
    }
}
