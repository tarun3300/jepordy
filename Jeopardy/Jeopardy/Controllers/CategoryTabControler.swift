//
//  CategoryTabControler.swift
//  Jeopardy
//
//  Created by TARUN GUDELA on 6/8/18.
//  Copyright © 2018 Mayago. All rights reserved.
//

import UIKit

class CategoryTabControler: UIViewController {

    @IBOutlet weak var category1: UIButton!
    @IBOutlet weak var category2: UIButton!
    @IBOutlet weak var category3: UIButton!
    
    @IBOutlet weak var category4: UIButton!
    @IBOutlet weak var category5: UIButton!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        category1.setTitle(Singleton.sharedInstance.selectedCategoryObject[0], for: .normal)
        category2.setTitle(Singleton.sharedInstance.selectedCategoryObject[1], for: .normal)
        category3.setTitle(Singleton.sharedInstance.selectedCategoryObject[2], for: .normal)
        category4.setTitle(Singleton.sharedInstance.selectedCategoryObject[3], for: .normal)
        category5.setTitle(Singleton.sharedInstance.selectedCategoryObject[4], for: .normal)
        
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
