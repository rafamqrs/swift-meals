//
//  NewItemViewController.swift
//  listaCrud
//
//  Created by Rafael Marques on 29/05/16.
//  Copyright © 2016 Rafael Marques. All rights reserved.
//

import UIKit

protocol AddAnItemDelegate{
    func add(item:Item)
}

class NewItemViewController: UIViewController {

    @IBOutlet var nameField:UITextField?
    @IBOutlet var caloriesField:UITextField?
    var delegate:AddAnItemDelegate?
    
    init(delegate:AddAnItemDelegate){
        self.delegate = delegate
        super.init(nibName: "NewItemViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBAction func add(){
        print("VAlores \(nameField?.text) \(caloriesField?.text)")
        if nameField == nil || caloriesField == nil{
            return
        }
        
        let name = nameField!.text
        let calories = Double(caloriesField!.text!)
        
        let item = Item(name: name!, calories: calories!)
        if delegate == nil{
            return
        }
        delegate!.add(item)
        
        print("Name \(item.name) \(item.calories)")

        if let navigation = navigationController{
            navigation.popViewControllerAnimated(true)
        }
    }
    
}
