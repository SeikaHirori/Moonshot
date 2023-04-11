//
//  ImageLabelView.swift
//  Moonshot
//
//  Created by Seika Hirori on 4/10/23.
//

import Foundation
import SwiftUI


struct imageVerticalLabelView: View {
    let mission: Mission
    
    var body: some View {
        
        return VStack {
            Image(mission.image)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding()
            
            VStack {
                Text(mission.displayName)
                    .font(.headline)
                    .foregroundColor(.white)
                Text(mission.formattedLaunchDate)
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.5))
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .background(.lightBackground)
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.lightBackground)
        )
        
    }
}

struct imageVerticalLabelView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        imageVerticalLabelView(mission: missions[0])
    }
}

