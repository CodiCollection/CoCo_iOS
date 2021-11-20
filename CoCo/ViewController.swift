//
//  ViewController.swift
//  CoCo
//
//  Created by Min-Kyu Lee on 2021/11/09.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    var container: NSPersistentContainer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard container != nil else {
            fatalError("This view needs a persistent container.")
        }
    }
}
