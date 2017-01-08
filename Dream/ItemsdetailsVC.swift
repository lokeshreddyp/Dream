//
//  ItemsdetailsVC.swift
//  Dream
//
//  Created by lokeshreddy on 1/8/17.
//  Copyright © 2017 lokeshreddy. All rights reserved.
//

import UIKit
import CoreData

class ItemsdetailsVC: UIViewController ,UITextFieldDelegate ,UIPickerViewDelegate , UIPickerViewDataSource{

    
    var stores = [Store]()
    
    
    @IBOutlet weak var tittle: UITextField!
    
    @IBOutlet weak var price: UITextField!
    
    @IBOutlet weak var saveBTN: UIButton!
    @IBOutlet weak var storePicker: UIPickerView!
    
    @IBOutlet weak var details: UITextField!
    
    //keyboard hides when we click on return button insoftware keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        tittle.resignFirstResponder()
        price.resignFirstResponder()
        details.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //to get plain barbutton item
       if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        }
        storePicker.delegate = self
        storePicker.dataSource = self
        
        
        //insert data into coredata
       
        
        
       // create store names
//        let store  = Store(context: appdelegate_context)
//        store.name = "Walmart"
//        let store1  = Store(context: appdelegate_context)
//        store1.name = "Amazon"
//        let store2  = Store(context: appdelegate_context)
//        store2.name = "Dollar tree"
//        let store3  = Store(context: appdelegate_context)
//        store3.name = "Caseys"
//        let store4  = Store(context: appdelegate_context)
//        store4.name = "Jcpenny"
        
        appdelegate.saveContext()
        
        teststores()

    }
    
    //getting the store name from Store entity
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let store = stores[row]
        return store.name
    }
    
    
    //number of rows
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stores.count
    }
    
    
    //number of columns
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //
    }
    
    
    //when uses touches the screen keyboard should hide
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func teststores() {
        let fetchrequest : NSFetchRequest<Store> = Store.fetchRequest()
        do {
            self.stores = try appdelegate_context.fetch(fetchrequest)
            self.storePicker.reloadAllComponents()
        }
        catch {
            let error = error as NSError
            print("\(error)")
            
        }
    }
    
    
    
    @IBAction func Savepressed(_ sender: UIButton) {
        
let item = Item(context: appdelegate_context)
        if let tittle = tittle.text {
            item.tittle = tittle
        }
        
        
//        if let price:Double  = Double(price.text!) {
//            item.price = price
//        }
 
        
        //converting to double using NSString class
        if let price = price.text {
            item.price = (price as NSString).doubleValue
        }
        
        
        if let details  = details.text {
            item.details = details
        }
        
        item.toStore = stores[storePicker.selectedRow(inComponent: 0)]
        appdelegate.saveContext()
      _ =  navigationController?.popViewController(animated: true)
        
    }
    
    
    
}
