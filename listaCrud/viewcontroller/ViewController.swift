//
//  ViewController.swift
//  listaCrud
//
//  Created by Rafael Marques on 24/05/16.
//  Copyright © 2016 Rafael Marques. All rights reserved.
//
protocol ViewControllerDelegate{
    func addMeals(meal:Meal)
}

import UIKit

class ViewController: UIViewController,
        UITableViewDataSource,
        UITableViewDelegate{

    @IBOutlet var nameField:UITextField?
    @IBOutlet var happinessField:UITextField?
    var delegate:ViewControllerDelegate?
    var items = [Item(name: "EggPlant", calories: 10),
                 Item(name: "Brownie1", calories: 321),
                 Item(name: "Brownie3", calories: 120),
                 Item(name: "Brownie2", calories: 321),
                 Item(name: "Brownie5", calories: 403),
                 Item(name: "Brownie6", calories: 3320)]
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        if cell == nil{
            return
        }
        cell!.accessoryType = UITableViewCellAccessoryType.Checkmark
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row
        let item = items[row]
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        cell.textLabel?.text = item.name
        return cell
    }
    
    @IBAction func add(){
        if nameField == nil || happinessField == nil{
            return
        }
        let happiness = Int(happinessField!.text!)
        
        if happiness == nil{
            return
        }
        
        if delegate == nil {
            return
        }
        let meal = Meal(name: nameField!.text!, happiness: happiness!)
        delegate!.addMeals(meal)

        print("eaten: \(meal.name) \(meal.happiness)")
        
        if let navigation = self.navigationController{
            navigation.popViewControllerAnimated(true)
        }
        
    }
    

}

