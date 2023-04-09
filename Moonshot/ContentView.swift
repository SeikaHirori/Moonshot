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

struct lesson_part_1: View {
    var body: some View {
       return VStack{
           Text("hello world")
           Image("Example")
               .resizable()
               .frame(width: 300, height: 300)
           
       }
    }
}
