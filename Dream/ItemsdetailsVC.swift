//
//  ItemsdetailsVC.swift
//  Dream
//
//  Created by lokeshreddy on 1/8/17.
//  Copyright © 2017 lokeshreddy. All rights reserved.
//

import UIKit

class ItemsdetailsVC: UIViewController ,UITextFieldDelegate{

    @IBOutlet weak var tittle: UITextField!
    
    @IBOutlet weak var price: UITextField!
    
    
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

        // Do any additional setup after loading the view.
    }

    
    
    
    //when uses touches the screen keyboard should hide
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
