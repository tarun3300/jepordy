//
//  Player.swift
//  Jeopardy
//
//  Created by Bernardo Cervantes Mayagoitia on 6/8/18.
//  Copyright © 2018 Mayago. All rights reserved.
//

import Foundation

class Player
{
    var name: String
    var score: Int
    init () {
            name = ""
        score = 0
    }
    
    init(Name: String, Score: Int) {
        name = Name
        score = Score
    }
}
