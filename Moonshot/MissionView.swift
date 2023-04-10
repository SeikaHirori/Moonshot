//
//  MissionView.swift
//  Moonshot
//
//  Created by Seika Hirori on 4/10/23.
//

import Foundation
import SwiftUI


struct MissionView: View {
    let mission: Mission
    
    let crew: [CrewMember]
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
            
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.6)
                        .padding()
                    
                    customDivider()
                    
                    VStack(alignment: .leading) {
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                        Text(mission.description)
                    }
                    .padding(.horizontal)
                    
                    customDivider()
                    
                    crewRoster(crew: crew)
                    
                }
                .padding(.bottom)
            }
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    struct crewRoster: View {
        let crew: [CrewMember]
        
        var body: some View {
            
            return VStack(alignment: .leading) {
                Text("Crew Members")
                    .font(.title.bold())
                    .padding(.bottom, 5)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(crew, id: \.role) { crewMember in
                            NavigationLink {
                                Text("Astronaut details")
                            } label: {
                                HStack {
                                    Image(crewMember.astronaut.id)
                                        .resizable()
                                        .frame(width: 104, height: 72)
                                        .clipShape(Circle())
                                        .overlay(
                                            Circle()
                                                .strokeBorder(.white, lineWidth: 3)
                                        )
                                    
                                    VStack(alignment: .leading) {
                                        Text(crewMember.astronaut.name)
                                            .foregroundColor(.white)
                                            .font(.headline)
                                        
                                        Text(crewMember.role)
                                            .foregroundColor(crewMember.role == "Command Pilot" ? .teal : .secondary)
                                    }
                                    
                                }
                                .padding(.horizontal)
                                
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
    }
    
    struct customDivider: View {
        var body: some View {
            return VStack {
                Rectangle()
                    .frame(height: 2)
                    .foregroundColor(.lightBackground)
                    .padding(.vertical)
            }
        }
    }
    
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        MissionView(mission: missions[0], astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}
