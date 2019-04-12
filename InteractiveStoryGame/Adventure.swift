//
//  Adventure.swift
//  InteractiveStoryGame
//
//  Created by Bobby Conti on 4/12/19.
//  Copyright © 2019 Bobby Conti. All rights reserved.
//

import Foundation

enum AdventureError: Error {
    case nameNotProvided
}

// Defines the model tree for the overall adventure
struct Adventure {
    static func story(withName name: String) -> Page {
        let returnTrip = Page(story: .returnTrip(name: name))
        let touchdown = returnTrip.addChoiceWith(title: "Stop and Investigate", story: .touchDown)
        let homeward = returnTrip.addChoiceWith(title: "Continue home to Earth", story: .homeward)
        
        let rover = touchdown.addChoiceWith(title: "Explore the Rover", story: .rover(name: name))
        let crate = touchdown.addChoiceWith(title: "Open the Crate", story: .crate)
        
        homeward.addChoiceWith(title: "Head back to Mars", page: touchdown)
        let home = homeward.addChoiceWith(title: "Continue Home to Earth", story: .home)
        
        let cave = rover.addChoiceWith(title: "Explore the Coordinates", story: .cave)
        rover.addChoiceWith(title: "Return to Earth", page: home)
        
        cave.addChoiceWith(title: "Continue towards faint light", story: .droid(name: name))
        cave.addChoiceWith(title: "Refill the ship and explore the rover", page: rover)
        
        crate.addChoiceWith(title: "Explore the Rover", page: rover)
        crate.addChoiceWith(title: "Use the key", story: .monster)
        
        return returnTrip
    }
}
