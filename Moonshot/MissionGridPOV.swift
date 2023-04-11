//
//  MissionGridPOV.swift
//  Moonshot
//
//  Created by Seika Hirori on 4/11/23.
//

import SwiftUI

struct MissionGridPOV: View {
    let missions: [Mission]
    let astronauts: [String: Astronaut]
    
    let columns:[GridItem] = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        
        return ScrollView{
            LazyVGrid(columns: columns) {
                ForEach(missions) { mission in
                    NavigationLink {
                        VStack {
                            MissionView(mission: mission, astronauts: astronauts)
                        }
                    } label: {
                        imageVerticalLabelView(mission: mission)
                    }
                }
            }
            .padding([.horizontal, .bottom])
        }
    }
}

struct MissionGridPOV_Previews: PreviewProvider {
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        MissionGridPOV(missions: missions, astronauts: astronauts)
            .background(.darkBackground)
            .preferredColorScheme(.dark)

    }
}
