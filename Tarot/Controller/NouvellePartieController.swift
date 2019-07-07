//
//  NouvellePartieController.swift
//  Tarot
//
//  Created by Serge Gori on 22/06/2019.
//  Copyright © 2019 Serge Gori. All rights reserved.
//

import UIKit
import CoreData

class NouvellePartieController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var cellId = "JoueurCell"
    
    var joueurs = [Joueur]()
    var cellTab = [JoueurCell]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchJoueurs()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return joueurs.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70 // ATTENTION SI LA LISTE EST TROP LONGUE --> MAUVAISE GESTION DES INDEX
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let joueurDeLaCell = joueurs[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as? JoueurCell {
            cell.miseEnPlace(joueur: joueurDeLaCell)
            return cell
        }
        return UITableViewCell()
        
    }
    
    
    //    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    //        switch editingStyle {
    //        case .delete:
    //            if let _ = tableView.cellForRow(at: indexPath) as? JoueurCell {
    //                let personneASupprimmer = joueurs[indexPath.row]
    //                contexte.delete(personneASupprimmer)
    //                do {
    //                    try contexte.save()
    //                } catch {
    //                    print(error.localizedDescription)
    //                }
    //                joueurs.remove(at: indexPath.row)
    //                self.tableView.deleteRows(at: [indexPath], with: .fade)
    //            }
    //
    //        default: break
    //        }
    //    }
    
    
    func fetchJoueurs() {
        let requete: NSFetchRequest<Joueur> = Joueur.fetchRequest()
        let tri = NSSortDescriptor(key: "nom", ascending: true)
        requete.sortDescriptors = [tri]
        do {
            joueurs = try contexte.fetch(requete)
            tableView.reloadData()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let more = UIContextualAction(style: .normal, title:  "More", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            //self.isEditing = false
            print("more button tapped")
            success(true)
        })
        more.backgroundColor = UIColor.lightGray
        
        let favorite = UIContextualAction(style: .normal, title:  "favorite", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            //self.isEditing = false
            print("favorite button tapped")
            success(true)
        })
        favorite.backgroundColor = UIColor.orange
        
        let share = UIContextualAction(style: .normal, title:  "share", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            //self.isEditing = false
            print("share button tapped")
            success(true)
        })
        share.backgroundColor = UIColor.blue
        
        return UISwipeActionsConfiguration(actions: [share, favorite, more,])
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        //        return UISwipeActionsConfiguration()
        
        guard let cell = tableView.cellForRow(at: indexPath) as? JoueurCell else { return nil }
        
        let choixAction = UIContextualAction(style: .normal, title:  "", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            
            // Recherche d'une cellule déjà sélectionnée
            if let pointeur = self.cellTab.firstIndex(of: cell) {
                self.cellTab.remove(at: pointeur)
                cell.idx = -1
                print("Index existant : \(pointeur)")
                // Mise à jour des cellules déjà sélectionnées
                var deb = pointeur
                while deb < self.cellTab.count {
                    self.cellTab[deb].idx = deb + 1
                    deb += 1
                    print("Réindexation : \(deb)")
                }
                // Nouvelle cellule sélectionnée
            } else {
                self.cellTab.append(cell)
                cell.idx = self.cellTab.count
                print("Index nouveau : \(self.cellTab.count)")
            }
            for item in self.cellTab {
                let surnom = item.surnom.text
                print("Choix réalisés : \(surnom)")
            }
            success(true)
        })
        
        
        if let _ = self.cellTab.firstIndex(of: cell) {
            choixAction.image = UIImage(named: "icons8-annuler-(dernier-chiffre)-50")
            choixAction.backgroundColor = .red
        } else {
            choixAction.image = UIImage(named: "icons8-cerclé-" + String(cellTab.count + 1) + "-1")
            choixAction.backgroundColor = .purple
        }
        
        
        return UISwipeActionsConfiguration(actions: [choixAction])
        
    }
}


