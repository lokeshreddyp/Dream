//
//  MainVC.swift
//  Dream
//
//  Created by lokeshreddy on 1/6/17.
//  Copyright © 2017 lokeshreddy. All rights reserved.
//

import UIKit
import CoreData

class MainVC: UIViewController ,UITableViewDelegate , UITableViewDataSource, NSFetchedResultsControllerDelegate{

    
    @IBOutlet weak var tableview: UITableView!
 
    
    @IBOutlet weak var segmentedcontrol: UISegmentedControl!
    
    
    var fetchresultscontroller :NSFetchedResultsController<Item>!
    override func viewDidLoad() {
        
        tableview.delegate = self
        tableview.dataSource = self
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
    func attemptFetch() {
let fetchRequest : NSFetchRequest<Item> = Item.fetchRequest()
        
let dateSort = NSSortDescriptor(key: "created", ascending: false)

fetchRequest.sortDescriptors = [dateSort]
        
        let fetchresultscontroller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext:context, sectionNameKeyPath: nil, cacheName: nil)
        
        
        
        
        do {
            try fetchresultscontroller.performFetch()
        }
        catch {
            let error  = error as NSError
            print("\(error)")
        }
    }
    
    //whenever the tableview is about to update then it will start to listen the changes and reloads the rows
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableview.beginUpdates()
    }
    
    //once the contents is chnaged then it will end
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableview.endUpdates()
    }
    
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch(type) {
        case.insert : if let indexPath = newIndexPath {
            tableview.insertRows(at:[indexPath], with: .fade)
            }
            break
        case.delete : if let indexPath = indexPath {
            tableview.deleteRows(at: [indexPath], with: .fade)
            }
    break
        case.update : if let indexPath = indexPath {
            let cell = tableview.cellForRow(at: indexPath) as! ItemCell
            //update the content
            
            }
            
            break
        case.move : if let indexPath = indexPath {
        tableview.deleteRows(at: [indexPath], with: .fade)
            
            }
            
        if let indexPath = newIndexPath {
            tableview.insertRows(at: [indexPath], with: .fade)
            }
        break
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

