//
//  imageHorizontalLabelView.swift
//  Moonshot
//
//  Created by Seika Hirori on 4/11/23.
//

import SwiftUI

struct imageHorizontalLabelView: View {
    let mission:Mission
    
    var body: some View {
        return HStack {
            Image(mission.image)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .padding()
            
            VStack {
                Text(mission.displayName)
                    .font(.headline)
                    .foregroundColor(.white)
                
                Text(mission.formattedLaunchDate)
                    .font(.caption.italic())
                    .foregroundColor(.white)

            }
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .background(.lightBackground)
            
        }
        .clipShape(RoundedRectangle(cornerRadius: 10)
        )
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(.lightBackground)
        }
    }
}

struct imageHorizontalLabelView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")

    
    static var previews: some View {
        imageHorizontalLabelView(mission: missions[1])
    }
}
