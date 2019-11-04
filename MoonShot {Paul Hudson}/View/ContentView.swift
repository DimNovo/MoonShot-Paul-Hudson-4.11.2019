//
//  ContentView.swift
//  MoonShot {Paul Hudson}
//
//  Created by Dmitry Novosyolov on 04/11/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var missionStore: MissionStore
    var body: some View {
        NavigationView {
            List(self.missionStore.missions) { mission in
                NavigationLink(destination: MissionView(mission: mission)) {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 65, height: 65)
                    
                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.system(size: 27, weight: .regular, design: .serif))
                        Text(mission.formattedLaunchDate)
                    }
                }
            }.navigationBarTitle("MoonShot")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(MissionStore())
            .colorScheme(.dark)
    }
}
