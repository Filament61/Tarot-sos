//
//  JoueurCell.swift
//  Tarot
//
//  Created by Serge Gori on 22/07/2019.
//  Copyright © 2019 Serge Gori. All rights reserved.
//

import UIKit


class JoueurCell: UITableViewCell {

    @IBOutlet weak var surnomLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var etatLabel: UILabel!
    
    @IBOutlet weak var ordreImage: UIImageView!
    @IBOutlet weak var classementImage: UIImageView!
    
    var joueur: Joueur!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func miseEnPlace(joueur: Joueur) {
        
        self.joueur = joueur
        
        surnomLabel.text = String(self.joueur.idJoueur)
//        ordreImage = String(self.joueur.ordre)
    }


}

