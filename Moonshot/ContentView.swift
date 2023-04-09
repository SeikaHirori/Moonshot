//
//  ContentView.swift
//  Moonshot
//
//  Created by Seika Hirori on 4/9/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        lesson_part_1()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct lesson_section_1_1: View {
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
