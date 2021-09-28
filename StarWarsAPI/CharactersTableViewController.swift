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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getPeople()
    }
    
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
//                print(String(data: data, encoding: .utf8))
            }
        }
    }
    
    //        if let url = URL(string: urlString) {
    //            var request = URLRequest(url: url)
    //            request.httpMethod = "GET"
    //            URLSession.shared.dataTask(with: request) {(data, response, error) in
    //
    //                if error != nil {
    //                    print("There is an error")
    //                } else if data != nil {
    //                    print(String(data: data!, encoding: .utf8))
    ////                    if let characterFromAPI = try? JSONDecoder().decode([Character].self, from: data!) {
    ////                        print(characterFromAPI)
    ////                    }
    //                }
    //            }.resume()
    //        }
    //    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        
        // Configure the cell...
        
        let character = characters[indexPath.row]
        cell.textLabel?.text = character.name
        return cell
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
