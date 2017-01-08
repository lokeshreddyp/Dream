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
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        
      //  testdata()
        attemptFetch()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        
        let cell = tableview.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        
        configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
        
        
        return cell
    }
    
    func configureCell(cell : ItemCell , indexPath : NSIndexPath) {
        let item  = fetchresultscontroller.object(at: indexPath as IndexPath)
        cell.configureCell(item: item)
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        if let sections = fetchresultscontroller.sections
        {
            let sectionInfo = sections[section]
            return sectionInfo.numberOfObjects
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if let sections = fetchresultscontroller.sections {
            return sections.count
        }
        
        return 0
    }
    
    
    
    
    func attemptFetch() {
let fetchRequest : NSFetchRequest<Item> = Item.fetchRequest()
        
let dateSort = NSSortDescriptor(key: "created", ascending: false)

fetchRequest.sortDescriptors = [dateSort]
        
        let fetchresultscontroller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext:appdelegate_context, sectionNameKeyPath: nil, cacheName:nil)
        
        fetchresultscontroller.delegate = self
        
        self.fetchresultscontroller = fetchresultscontroller
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
            
            configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
            
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
    
    
    func testdata() {
        let item = Item(context: appdelegate_context)
        item.tittle = "book1"
        item.price = 1000
        item.details = "hello this is test one to check whether data inside table view is working properly or not.Just a check"
       
        let item1 = Item(context: appdelegate_context)
        item1.tittle = "book2"
        item1.price = 100
        item1.details = "hello this is test one to check whether data inside table view is working properly or not.Just a check"
        let item2 = Item(context: appdelegate_context)
        item2.tittle = "book3"
        item2.price = 10
        item2.details = "hello this is test one to check whether data inside table view is working properly or not.Just a check"
        
        appdelegate.saveContext()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

