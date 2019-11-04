//
//  Model.swift
//  MoonShot {Paul Hudson}
//
//  Created by Dmitry Novosyolov on 04/11/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import Foundation

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name, role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    var image: String {
        "apollo\(id)"
    }
    var formattedLaunchDate: String {
        if let launchDate = launchDate {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter.string(from: launchDate)
        } else {
            return "N/A"
        }
    }
}

struct Astronaut: Codable, Identifiable {
    let id, name, description: String
}

struct CrewMember {
    let role: String
    let astronaut: Astronaut
}

enum ProjectJsonFile: String {
    case astronauts = "astronauts.json"
    case missions = "missions.json"
}
