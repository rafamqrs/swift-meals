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
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(MealsTableViewController.showDetails(_:)))
        cell.addGestureRecognizer(longPress)
        return cell
    }
    //Detalhes para Gesto de Pressionar o Item
    func showDetails(recognizer: UILongPressGestureRecognizer){
        if recognizer.state == UIGestureRecognizerState.Began {
            let cell = recognizer.view as! UITableViewCell
            let indexPath = tableView.indexPathForCell(cell)
            if indexPath == nil{
                return
            }
            let row = indexPath!.row
            let meal = meals[row]
            
            var mensagem = "Happiness: \(meal.happiness)"
            
            for item in meal.items{
                mensagem += "\n * \(item.name) - \(item.calories) calories"
            }
            //Mostra os detalhes do objeto selecionado
            let details = UIAlertController(title: meal.name, message: mensagem, preferredStyle: UIAlertControllerStyle.Alert)
            //botao para fechar o modal de alerta
            let btnOk = UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil)
            details.addAction(btnOk)
            
            //Exibe na tela o modal com os details de forma animado
            presentViewController(details, animated: true, completion: nil)
        }
    }
}
