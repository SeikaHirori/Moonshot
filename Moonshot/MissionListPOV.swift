//
//  MissionListPOV.swift
//  Moonshot
//
//  Created by Seika Hirori on 4/11/23.
//

import SwiftUI

struct MissionListPOV: View {
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    
    var body: some View {
        
        return ScrollView{
            
            
            LazyVStack {
                ForEach(missions) { mission in
                    NavigationLink {
                        VStack {
                            MissionView(mission: mission, astronauts: astronauts)
                        }
                    } label: {
                        imageHorizontalLabelView(mission: mission)
                    }
                }
            }
        }
    }
}

struct MissionListPOV_Previews: PreviewProvider {
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static let missions: [Mission] = Bundle.main.decode("missions.json")

    
    static var previews: some View {
        MissionListPOV(astronauts: astronauts, missions: missions)
            .background(.darkBackground)
            .preferredColorScheme(.dark)

    }
}
