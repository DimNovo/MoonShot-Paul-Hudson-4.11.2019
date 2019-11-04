//
//  MissionView.swift
//  MoonShot {Paul Hudson}
//
//  Created by Dmitry Novosyolov on 04/11/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import SwiftUI

struct MissionView: View {
    @EnvironmentObject var missionStore: MissionStore
    let mission: Mission
    var body: some View {
        GeometryReader { geometryProxy in
            ScrollView(.vertical) {
                VStack {
                    Image(self.mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometryProxy.size.width * 0.7)
                        .padding(.top)
                    Text(self.mission.description)
                        .padding()
                    
                    ForEach(self.missionStore.getAstroPerMission(mission: self.mission), id: \.role) { crewMember in
                        HStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 83, height: 60)
                                .clipShape(Capsule())
                                .overlay(Capsule().stroke(Color.primary, lineWidth: 1))
                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .font(.headline)
                                Text(crewMember.role)
                                    .foregroundColor(.secondary)
                            }
                            Spacer()
                            NavigationLink(destination: AstronautView(astronaut: crewMember.astronaut)) {
                                Image(systemName: "info.circle").font(.system(size: 22)).foregroundColor(.green)
                            }
                        }.padding(.horizontal)
                    }
                    Spacer(minLength: 25)
                }
            }
        }.navigationBarTitle("\(mission.displayName)", displayMode: .inline)
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode(ProjectJsonFile.missions.rawValue)
    static var previews: some View {
        MissionView(mission: missions[0]).environmentObject(MissionStore())
    }
}
