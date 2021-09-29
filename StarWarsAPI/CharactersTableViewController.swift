//
//  CharactersTableViewController.swift
//  StarWarsAPI
//
//  Created by Jimenez on 9/27/21.
//

import UIKit

class CharactersTableViewController: UITableViewController {
    //    @Published var pokemon = [Pokemon]()
    var characters = [Character]()
    var page = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getPeople()
    }
    
    @IBAction func refreshTapped(_ sender: Any) {
        getPeople2()
    }
    
    //MARK: Parsing Data
    func parse(json: Data) {
        let decoder = JSONDecoder()

        if let jsonCharacters = try? decoder.decode(Characters.self, from: json) {
            characters = jsonCharacters.results
            tableView.reloadData()
        }
    }
    
    func getPeople() {
        //https://swapi.dev/api/people/
        //https://pokedex-bb36f.firebaseio.com/pokemon.json
        
        let urlString = "https://swapi.dev/api/people/"
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
            }
        }
    }
    
    func getPeople2() {
        //https://swapi.dev/api/people/
        //https://pokedex-bb36f.firebaseio.com/pokemon.json
        
        let urlString = "https://swapi.dev/api/people/?page=" + String(page)
        if page < 8 {
            page += 1
        } else {
            page = 1
        }
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
            }
        }
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath) as? PersonTableViewCell {
            
            let character = characters[indexPath.row]
            
            cell.nameLabel.text = character.name
//            cell.personImage
            return cell
        }
        return UITableViewCell()
    }
}



extension Data {
    func parseData(removeString string: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parsedDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        guard let data = parsedDataString?.data(using: .utf8) else { return nil}
        return data
    }
}
