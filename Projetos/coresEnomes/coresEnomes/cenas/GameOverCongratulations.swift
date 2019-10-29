//
//  GameOverCongratulations.swift
//  coresEnomes
//
//  Created by Mateus Rodrigues Santos on 28/10/19.
//  Copyright © 2019 Mateus Rodrigues Santos. All rights reserved.
//

import Foundation
import SpriteKit
import CloudKit

class GameOverCongratulations: SKScene {
    
    let privateDatabase = CKContainer(identifier: "iCloud.Mateus.CoresEnomes.HanckingGame2").privateCloudDatabase
    
    override func didMove(to view: SKView) {
        backgroundColor = .white
        if erro >= 20{
            let gameOver = SKLabelNode(fontNamed: "Arial")
            gameOver.text = "Game Over"
            gameOver.fontColor = .red
            gameOver.fontSize = 60
            gameOver.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
            self.addChild(gameOver)
        }else{
            let winner = SKLabelNode(fontNamed: "Arial")
            winner.text = "Parabéns!!!"
            winner.fontColor = .blue
            winner.fontSize = 60
            winner.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
            self.addChild(winner)
        }

        let jogadorHancking = JogadorCT(nome: nomeJogador, pontos: acerto*10, acertos: erro, erros: acerto)

        self.salvar(nome: jogadorHancking.nome, pontos: jogadorHancking.pontos)
    }
    
    
    func salvar(nome:String,pontos:Int)  {
           
        let record = CKRecord(recordType: "Jogador")
           
        record.setValue (nome, forKey: "nome")
        record.setValue(pontos, forKey: "pontos")
           
        self.privateDatabase.save(record) { (savedRecord, error)  in
               if error == nil {
                 print("Record Saved")
               } else {
                   print("Record Not Saved")
               }
        }
    }
}
