//
//  Meal.swift
//  listaCrud
//
//  Created by Rafael Marques on 24/05/16.
//  Copyright © 2016 Rafael Marques. All rights reserved.
//

import Foundation

class Meal {
    let name:String
    let happiness:Int
    var items = Array<Item>()
    
    init(name:String, happiness: Int){
        self.name = name
        self.happiness = happiness
    }
    
    func allCalories() -> Double{
        var total = 0.0
        for item in items{
            total += item.calories
        }
        return total
    }
}