//
//  itemDetailVC.swift
//  DreamMachine
//
//  Created by Aleksandr Shenshin on 29.07.17.
//  Copyright © 2017 Aleksandr Shenshin. All rights reserved.
//

import UIKit

class itemDetailVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //убирает надпись back рядом с кнопочкой. Возможно,
        //что криво, но лектор предложил еще более жуткий путь
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem()
        }
    }


}
