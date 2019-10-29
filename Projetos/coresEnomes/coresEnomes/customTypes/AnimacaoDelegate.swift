//
//  AnimacoesCT.swift
//  coresEnomes
//
//  Created by Mateus Rodrigues Santos on 24/10/19.
//  Copyright © 2019 Mateus Rodrigues Santos. All rights reserved.
//

import Foundation
import SpriteKit

struct AnimationDelegate:Animacoes {
    
    //MARK: Métodos de spawn das peças
    func spawnPecas(scene: SKScene){
        let wait1  = SKAction.wait(forDuration: 0.5)
        let wait2   = SKAction.wait(forDuration:  1.5)
        let action = SKAction.sequence([wait1, spawn(scene: scene), wait2])
        let forever = SKAction.repeatForever(action)

        scene.run(forever)
    }

    func spawn(scene:SKScene) -> SKAction {
        let animacao = SKAction.run {
            let peca:PecaCT!
            
            let num = Int(arc4random_uniform(9))
            switch num {
            case 0:
                peca = PecaCT(scene: scene,cor: .yellow, nomeCor: "Verde",nomeVerdadeiro: "Amarelo")
                self.adicionarPecaNaCena(scene: scene, peca: peca)
            case 1:
                peca = PecaCT(scene: scene,cor: .blue, nomeCor: "Vermelho",nomeVerdadeiro: "Azul")
                self.adicionarPecaNaCena(scene: scene, peca: peca)
            case 2:
                peca = PecaCT(scene: scene,cor: .black, nomeCor: "Roxo",nomeVerdadeiro: "Preto")
                self.adicionarPecaNaCena(scene: scene, peca: peca)
            case 3:
                peca = PecaCT(scene: scene,cor: .green, nomeCor: "Preto",nomeVerdadeiro: "Verde")
                self.adicionarPecaNaCena(scene: scene, peca: peca)
            case 4:
                peca = PecaCT(scene: scene,cor: .red, nomeCor: "Branco",nomeVerdadeiro: "Vemelho")
                self.adicionarPecaNaCena(scene: scene, peca: peca)
            case 5:
                peca = PecaCT(scene: scene,cor: .brown, nomeCor: "Laranja",nomeVerdadeiro: "Marrom")
                self.adicionarPecaNaCena(scene: scene, peca: peca)
            case 6:
                peca = PecaCT(scene: scene,cor: .cyan, nomeCor: "Laranja",nomeVerdadeiro: "Azulado")
                self.adicionarPecaNaCena(scene: scene, peca: peca)
            case 7:
                peca = PecaCT(scene: scene,cor: .orange, nomeCor: "Marrom",nomeVerdadeiro: "Laranja")
                self.adicionarPecaNaCena(scene: scene, peca: peca)
            case 8:
                peca = PecaCT(scene: scene,cor: .magenta, nomeCor: "Amarelo",nomeVerdadeiro: "Magenta")
                self.adicionarPecaNaCena(scene: scene, peca: peca)
            default:
                print("Não definiu a cor")
            }
        }
    
        return animacao
    }
    
    func adicionarPecaNaCena(scene:SKScene,peca:PecaCT){
        scene.addChild(peca)
        peca.run(self.moverPeca(),completion: {peca.desaparecer()})
    }

    
    func moverPeca() -> SKAction {
        let animacao = SKAction.moveTo(x: 1200, duration: 15.0)
        return animacao
    }
    //
}
