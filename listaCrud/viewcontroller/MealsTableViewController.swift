//
//  MealsTableViewController.swift
//  listaCrud
//
//  Created by Rafael Marques on 24/05/16.
//  Copyright © 2016 Rafael Marques. All rights reserved.
//

import UIKit

class MealsTableViewController: UITableViewController,
        ViewControllerDelegate{

    var meals = [Meal(name: "EggPlants", happiness: 1),
                 Meal(name: "White Brownie", happiness: 5)]
    
    func addMeals(meal:Meal){
        meals.append(meal)
        self.tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "addMeal"{
            let viewController = segue.destinationViewController as! ViewController
            viewController.delegate = self
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row
        let meal = meals[row]
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        cell.textLabel?.text = meal.name
        return cell
    }
}
