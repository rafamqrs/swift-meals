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
        UITableViewDelegate,
        AddAnItemDelegate{

    @IBOutlet var nameField:UITextField?
    @IBOutlet var happinessField:UITextField?
    @IBOutlet var tableView:UITableView?
    
    var delegate:ViewControllerDelegate?
    var items = [Item(name: "EggPlant", calories: 10),
                 Item(name: "Brownie1", calories: 321),
                 Item(name: "Brownie3", calories: 120)]
    
    var selecionados = Array<Item>()
    
    func add(item: Item) {
        items.append(item)
        print("PASSEI AQUI valor item \(item.calories)")
        if tableView == nil{
            return
        }
        tableView!.reloadData()
    }
    
    override func viewDidLoad() {
        let barButton   = UIBarButtonItem(title: "New Item",
                        style: UIBarButtonItemStyle.Plain,
                        target: self,
                        action: #selector(ViewController.showNewItem))
        navigationItem.rightBarButtonItem = barButton
    }
    
    func showNewItem(){
        let newItem = NewItemViewController(delegate: self)
        if let navigation = navigationController {
            navigation.pushViewController(newItem, animated: true)
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        if cell == nil{
            return
        }
        var item = items[indexPath.row]
        if cell!.accessoryType == UITableViewCellAccessoryType.None{
            cell!.accessoryType = UITableViewCellAccessoryType.Checkmark
            selecionados.append(item)
        }else{
            cell!.accessoryType = UITableViewCellAccessoryType.None
            if let posIndex = selecionados.indexOf(item){
                selecionados.removeAtIndex(posIndex)
            }
        
        }
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
        meal.items = selecionados
        delegate!.addMeals(meal)

        print("eaten: \(meal.name) \(meal.happiness) \(meal.items)")
        
        if let navigation = self.navigationController{
            navigation.popViewControllerAnimated(true)
        }
        
    }
    

}

