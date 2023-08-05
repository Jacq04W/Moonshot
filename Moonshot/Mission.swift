//
//  Mission.swift
//  Moonshot
//
//  Created by Jacquese Whitson on 8/5/23.
//

import Foundation
// These are for our missions Json data
struct Mission: Codable, Identifiable {
    //nested because we want the missions.crewRole when we mention it
    struct CrewRole: Codable {
        let name: String
        let role: String
    }

    let id: Int
    let launchDate: Date?
    // json data specified that crew is an array 
    let crew: [CrewRole]
    let description: String
    
    //use these for UI 
    var displayName: String {
        "Apollo \(id)"
    }

    var image: String {
        "apollo\(id)"
    }
    // use this for the decoded date we get back 
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
        
}
