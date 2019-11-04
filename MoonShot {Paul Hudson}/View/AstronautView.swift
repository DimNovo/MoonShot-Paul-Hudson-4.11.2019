//
//  AstronautView.swift
//  MoonShot {Paul Hudson}
//
//  Created by Dmitry Novosyolov on 04/11/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    var body: some View {
        GeometryReader { geometryProxy in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometryProxy.size.width)
                    Text(self.astronaut.description)
                        .padding()
                        .layoutPriority(1.0)
                }
            }
        }.navigationBarTitle("\(astronaut.name)", displayMode: .inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode(ProjectJsonFile.astronauts.rawValue)
    static var previews: some View {
        AstronautView(astronaut: astronauts[0])
    }
}
