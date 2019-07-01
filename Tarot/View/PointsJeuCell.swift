//
//  PointsJeuCell.swift
//  Tarot
//
//  Created by Serge Gori on 26/06/2019.
//  Copyright © 2019 Serge Gori. All rights reserved.
//

import UIKit

class PointsJeuCell: UITableViewCell {
    
    @IBOutlet weak var gainLabel: UILabel!
    @IBOutlet weak var baseLabel: UILabel!    
    @IBOutlet weak var petitAuBoutLabel: UILabel!
    @IBOutlet weak var sousTotal: UILabel!
    @IBOutlet weak var poigneeLabel: UILabel!
    @IBOutlet weak var chelemLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    
    func miseEnPlace(pJ: JeuResultat) {
        
        let score = JeuComplet(Contrat: Int(pJ.contrat),
                               NombreDeBout: Int(pJ.nbBout),
                               PointFaits: pJ.pointsFaits,
                               PetitAuBout: Int(pJ.petitAuBout),
                               Poignée: Int(pJ.poignee),
                               Chelem: Int(pJ.chelem))
        
        
        gainLabel.text = score.gainText()
        baseLabel.text = score.baseText()
        sousTotal.text = score.SousTotalText()
        petitAuBoutLabel.text = score.pointsPetitAuBoutText()
        poigneeLabel.text = score.pointsPoigneeText()
        chelemLabel.text = score.pointsChelemText()
        totalLabel.text = score.totalText()
    }
    
    
}