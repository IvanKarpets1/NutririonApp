//
//  ViewController.swift
//  NutritionApp
//
//  Created by Ivan Karpets on 5/28/19.
//  Copyright © 2019 Ivan Karpets. All rights reserved.
//

import UIKit

struct Ingredient: Codable {
    let name: String
    let protein: Float
    let fat: Float
    let carbs: Float
    let calories: Int
}

class TableViewController: UITableViewController {

    var arrayOfCellData = [Ingredient]()
    let fileName = "ingredients"
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDataFromJSON()
        
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfCellData.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("IngredientCell", owner: self, options: nil)?.first as! IngredientCell
        let ingredientName = arrayOfCellData[indexPath.row].name
        cell.ingredientLabel.text = ingredientName
        print(ingredientName)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let detailVC = segue.destination as? DetailViewController else {
            return
        }
        print(arrayOfCellData[(tableView.indexPathForSelectedRow?.row)!].name)
        detailVC.name = arrayOfCellData[(tableView.indexPathForSelectedRow?.row)!].name
        detailVC.protein = arrayOfCellData[(tableView.indexPathForSelectedRow?.row)!].protein
        detailVC.fat = arrayOfCellData[(tableView.indexPathForSelectedRow?.row)!].fat
        detailVC.carbs = arrayOfCellData[(tableView.indexPathForSelectedRow?.row)!].carbs
        detailVC.calories = arrayOfCellData[(tableView.indexPathForSelectedRow?.row)!].calories
        
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: self)
    }


    func fetchDataFromJSON(){
        guard let path = Bundle.main.path(forResource: fileName, ofType: "json") else {return}
        
        let url = URL(fileURLWithPath: path)
        
            do {

                let data = try Data(contentsOf: url)
                let ingredients = try JSONDecoder().decode([Ingredient].self, from: data)
                
                arrayOfCellData.append(contentsOf: ingredients)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                
                print(error.localizedDescription)
            }
        
    }
    
}
