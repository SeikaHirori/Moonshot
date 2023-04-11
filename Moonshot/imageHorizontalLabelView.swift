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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct imageHorizontalLabelView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")

    
    static var previews: some View {
        imageHorizontalLabelView(mission: missions[0])
    }
}
