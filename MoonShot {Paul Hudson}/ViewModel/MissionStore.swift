//
//  MissionStore.swift
//  MoonShot {Paul Hudson}
//
//  Created by Dmitry Novosyolov on 04/11/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import Foundation

final class MissionStore: ObservableObject {
    
    @Published var missions: [Mission] = []
    private var astronauts: [Astronaut] = []
    
    init() { getAllData()}
    
    func getAllData() {
        //        DispatchQueue.main.async {
        self.astronauts = Bundle.main.decode(ProjectJsonFile.astronauts.rawValue)
        self.missions = Bundle.main.decode(ProjectJsonFile.missions.rawValue)
        //        }
    }
    
    func getAstroPerMission(mission: Mission) -> [CrewMember] {
        var matches = [CrewMember]()
        mission.crew.forEach { member in
            if let match = astronauts.first(where: { $0.id == member.name }) {
                matches.append(CrewMember(role: member.role, astronaut: match))
            } else {
                fatalError("Missing \(member)")
            }
        }
        return matches
    }
}
