//
//  ContentView.swift
//  Moonshot
//
//  Created by Seika Hirori on 4/9/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        implementation_part_2()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct implementation_part_2: View {
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let mission: [Mission] = Bundle.main.decode("missions.json")
    
    let columns:[GridItem] = [GridItem(.adaptive(minimum: 150))]
    
    
    var body: some View {
        return NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(mission) { mission in
                        NavigationLink {
                            VStack {
                                Text("Detail view")
                            }
                        } label: {
                            imageLabel(mission: mission)
                        }
                    }
                }
            }
            .navigationTitle("Moonshot")
        }
    }
    
    
    struct imageLabel: View {
        let mission: Mission
        
        var body: some View {
            
            return VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                
                VStack {
                    Text(mission.displayName)
                        .font(.headline)
                    Text(mission.launchDate ?? "N/A")
                        .font(.caption)
                }
                .frame(maxWidth: .infinity)
            }
        }
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
        return VStack {
            Button("Decode JSON with Taylor Swift") {
                let input: String = """
{
    "name": "Taylor Swift",
    "address": {
        "street": "555, Taylor Swift Avenue",
        "city": "Nashville"
    }
}
"""
                
                let data = Data(input.utf8)
                let decoder = JSONDecoder()
                if let user = try? decoder.decode(User.self, from:data) {
                    print(user.name)
                    print(user.address.street)
                    print(user.address.city)
                    print()
                }
                
                
            }
            
            List(0..<5) { num in
                let but_name:String = "Button \(num)"
                
                Button(but_name) {

                    let input:String = """
{
    "name": "Person \(num)",
    "address": {
        "street": "street \(num)",
        "city": "city \(num)"
    }
}
"""
                    let data = Data(input.utf8)
                    let decoder: JSONDecoder = JSONDecoder()
                    
                    if let user = try? decoder.decode(User.self, from: data) {
                        print(user.name)
                        print(user.address.street)
                        print(user.address.city)
                        print()
                    }
                    
                    
                }
                
            }
            
        }
    }
    
    struct User: Codable {
        let name: String
        let address: Address
    }
    
    struct Address: Codable {
        let street: String
        let city: String
    }
    
}


struct lesson_section_1_6: View {
    
    let layout: [GridItem] = [
        GridItem(.adaptive(minimum: 80, maximum: 120)),
    ]
    
//    var body: some View {
//        return ScrollView {
//            LazyVGrid(columns: layout) {
//                ForEach(0..<1000) {
//                    Text("Item \($0)")
//                }
//            }
//
//        }
//
//    }
    
    var body: some View {
        return ScrollView(.horizontal) {
            LazyHGrid(rows: layout) {
                ForEach(0..<1000) {
                    Text("Item \($0)")
                }
            }
        }
    }
    
}
