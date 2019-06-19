//
//  AjoutPersonneControler.swift
//  Tarot
//
//  Created by Serge Gori on 19/06/2019.
//  Copyright © 2019 Serge Gori. All rights reserved.
//

import UIKit
import CoreData

class AjoutPersonneController: UIViewController {

    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var surnomTextField: UITextField!
    
    @IBOutlet weak var ajouterPersonneBouton: UIButton!
    @IBOutlet weak var prenomTextField: UITextField!
    @IBOutlet weak var nomTextField: UITextField!
    
   
    @IBOutlet weak var contrainteDuBas: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        miseEnPlaceImagePicker()
//        miseEnPlacePicker()
        miseEnPlaceTextField()
        miseEnPlaceNotification()
//        fetchEntreprises()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        largeurContrainte.constant = view.frame.width
//        scroll.contentSize = CGSize(width: largeurContrainte.constant, height: scroll.frame.height)
    }
    
    
//    func fetchEntreprises() {
//        let requete: NSFetchRequest<Entreprise> = Entreprise.fetchRequest()
//        let tri = NSSortDescriptor(key: "nom", ascending: true)
//        requete.sortDescriptors = [tri]
//        do {
//            entreprises = try contexte.fetch(requete)
//            pickerView.reloadAllComponents()
//        } catch {
//            print(error.localizedDescription)
//        }
//    }

    
    @IBAction func ajouterPersonneAction(_ sender: UIButton) {
        view.endEditing(true)
        let nouvellePersonne = Personne(context: contexte)
        if prenomTextField.text != nil {
            nouvellePersonne.prenom = prenomTextField.text!
        }
        if nomTextField.text != nil {
            nouvellePersonne.nom = nomTextField.text!
        }
        if surnomTextField.text != nil {
            nouvellePersonne.surnom = surnomTextField.text!
        }

        appDelegate.saveContext()
        navigationController?.popViewController(animated: true)
    }
    
}
