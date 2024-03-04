//
//  ViewController.swift
//  Network&APITask
//
//  Created by Nada Alshaibani on 04/03/2024.
//

import UIKit

class PetTableViewController: UITableViewController {
    
    var pets: [Pet] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pets"
        // Do any additional setup after loading the view.
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        fetchPetsData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pets.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let pet = pets[indexPath.row]
        cell.textLabel?.text = "Pet name: \(pet.name) \t\t Adopted: \(pet.adopted)"
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailPetViewController()
        detailVC.pet = pets[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
}


extension PetTableViewController{
    
    func fetchPetsData() {
         NetworkManager.shared.fetchPets { fetchedPets in
             DispatchQueue.main.async {
                 self.pets = fetchedPets ?? []
                 self.tableView.reloadData()
             }
         }
     }
}



