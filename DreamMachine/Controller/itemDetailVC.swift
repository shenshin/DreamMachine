//
//  itemDetailVC.swift
//  DreamMachine
//
//  Created by Aleksandr Shenshin on 29.07.17.
//  Copyright © 2017 Aleksandr Shenshin. All rights reserved.
//

import UIKit
import CoreData

class itemDetailVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var storePicker: UIPickerView!
    @IBOutlet weak var titleField: CustomTextField!
    @IBOutlet weak var priceField: CustomTextField!
    @IBOutlet weak var detailsField: CustomTextField!
    
    //var stores:[Store] = Array()
    var stores = [Store]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storePicker.delegate = self
        storePicker.dataSource = self
        
        //убирает надпись back рядом с кнопочкой. Возможно,
        //что криво, но лектор предложил еще более жуткий путь
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem()
        }
       
        getStores()
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return stores[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stores.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        print("pickerView: \(pickerView), row: \(row), component: \(component).")
    }
    
    
    //совершает запрос к базе данных обо все магазинах и заполняет pickerView этими магазинами
    func getStores() {
        let fetchRequest: NSFetchRequest<Store> = Store.fetchRequest()
        
        do {
            self.stores = try context.fetch(fetchRequest)
            self.storePicker.reloadAllComponents()
        } catch {
            let error = error as NSError
            error.value(forKey: "невозможно получить список магазинов")
            print(error.description)
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
}
