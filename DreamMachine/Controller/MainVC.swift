//
//  MainVC.swift
//  DreamMachine
//
//  Created by Aleksandr Shenshin on 25.07.17.
//  Copyright © 2017 Aleksandr Shenshin. All rights reserved.
//

import UIKit
import CoreData

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segment: UISegmentedControl!
    
    var controller: NSFetchedResultsController<Item>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        genetateTestData()
        attemptFetch()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
        return cell
    }
    
    func configureCell(cell: ItemCell, indexPath: NSIndexPath){
        let item = controller.object(at: indexPath as IndexPath)
        cell.configureCell(item: item)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = controller.sections {
            let sectionInfo = sections[section]
            return sectionInfo.numberOfObjects
        }
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if let sections = controller.sections {
            return sections.count
        }
        return 0
    }
    
    func attemptFetch() {
        let fetchRequest: NSFetchRequest<Item> = Item.fetchRequest()
        let dateSort = NSSortDescriptor(key: "created", ascending: false)
        fetchRequest.sortDescriptors = [dateSort]
        
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        self.controller = controller
        
        do {
            try controller.performFetch()
        } catch {
            let error = error as NSError
            print(error)
        }
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case.insert:
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .fade)
            }
        case.delete:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        case.update:
            if let indexPath = indexPath {
                let cell = tableView.cellForRow(at: indexPath) as! ItemCell
                configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
            }
        case.move:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            
        } //switch
        
    } //func controller
    
    func genetateTestData() {
        let item1 = Item(context: context)
        item1.title = "iMac 21.1 - 1"
        item1.price = 79990.00
        item1.details =  """
        2-ядерный процессор Intel Core i5 с тактовой частотой 2,3 ГГц; 8 ГБ встроенной памяти DDR4 2133 МГц; Жёсткий диск 5400 об/﻿мин ёмкостью 1 ТБ; Графический адаптер: Intel Iris Plus Graphics 640...
        """
        
        let item2 = Item(context: context)
        item2.title = "iMac 21.1 - 2"
        item2.price = 94990.00
        item2.details = """
        4-ядерный процессор Intel Core i5 с тактовой частотой 3,0 ГГц; 8 ГБ встроенной памяти DDR4 2400 МГц; Жёсткий диск 5400 об/﻿мин ёмкостью 1 ТБ; Видеокарта: Radeon Pro 555 с 2 ГБ памяти VRAM...
        """
        
        let item3 = Item(context: context)
        item3.title = "iMac 21.1 - 3"
        item3.price = 109990.00
        item3.details = """
        4-ядерный процессор Intel Core i5 с тактовой частотой 3,4 ГГц; 8 ГБ встроенной памяти DDR4 2400 МГц; Накопитель Fusion Drive ёмкостью 1 ТБ; Видиокарта: Radeon Pro 560 с 4 ГБ памяти VRAM...
        """
    }
    
} //class

