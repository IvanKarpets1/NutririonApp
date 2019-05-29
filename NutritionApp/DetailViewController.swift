//
//  DetailViewController.swift
//  NutritionApp
//
//  Created by Ivan Karpets on 5/28/19.
//  Copyright © 2019 Ivan Karpets. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    var name: String!
    var protein: Float!
    var carbs: Float!
    var fat: Float!
    var calories: Int!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ingredientName.text = name
        
        kilocaloriesNumber.text = String(calories)
        proteinsNumber.text = String(protein)
        fatsNumber.text = String(fat)
        carbohydrates.text = String(carbs)
        
    }
    
    @IBOutlet weak var ingredientName: UILabel!
    @IBOutlet weak var kilocaloriesNumber: UILabel!
    @IBOutlet weak var proteinsNumber: UILabel!
    @IBOutlet weak var fatsNumber: UILabel!
    @IBOutlet weak var carbohydrates: UILabel!
}
