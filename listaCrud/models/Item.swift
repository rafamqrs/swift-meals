//
//  Item.swift
//  listaCrud
//
//  Created by Rafael Marques on 24/05/16.
//  Copyright © 2016 Rafael Marques. All rights reserved.
//

import Foundation

class Item : Equatable{
    let name:String
    let calories:Double
    
    init(name:String, calories:Double){
        self.name = name
        self.calories = calories
    }
    
}

func ==(firstItem: Item, secundItem: Item) -> Bool{
    return firstItem.name == secundItem.name && firstItem.calories == secundItem.calories
}