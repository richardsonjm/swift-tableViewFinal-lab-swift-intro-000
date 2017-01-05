//
//  PlanetTableViewController.swift
//  TableViewFinal
//
//  Created by James Campagno on 6/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class PlanetTableViewController: UITableViewController {
    let planetCellIdentifier = "PlanetCell"
    var planets: [Planet] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generatePlanetInfo()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planets.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! FactTableViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            let planet = planets[indexPath.row]
            dest.planet = planet
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: planetCellIdentifier, for: indexPath) as! PlanetTableViewCell
        
        let planet = planets[indexPath.row]
        cell.planetNameLabel.text = planet.name
        cell.numberOfDaysFullOrbitLabel.text = "\(planet.fullOrbit) days (full orbit)"
        cell.numberOfFacts.text = "\(planet.facts.count) facts"
        
        switch planet.numberOfMoons {
        case 0: cell.numberOfMoonsLabel.text = "No Moons"
        case 1: cell.numberOfMoonsLabel.text = "1 Moon"
        default: cell.numberOfMoonsLabel.text = "\(planet.numberOfMoons) Moons"
        }
    
        return cell
    }
    
    func generatePlanetInfo() {
        let earthFacts = [
            "Earth is the only planet not named after a god.",
            "Earth has a powerful magnetic field.",
            "Earth was once believed to be the center of the universe."
        ]
        let earth = Planet(name: "Earth", numberOfMoons: 1, fullOrbit: 365.26, facts: earthFacts)
        let marsFacts = [
            "Mars and Earth have approximately the same landmass.",
            "Mars is home to the tallest mountain in the solar system.",
            "Pieces of Mars have fallen to Earth."
        ]
        let mars = Planet(name: "Mars", numberOfMoons: 2, fullOrbit: 687.0, facts: marsFacts)
        planets = [earth, mars]
    }
}
