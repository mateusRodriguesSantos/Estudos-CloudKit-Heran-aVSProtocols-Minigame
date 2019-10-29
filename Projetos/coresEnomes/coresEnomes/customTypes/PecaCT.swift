//
//  Peca.swift
//  coresEnomes
//
//  Created by Mateus Rodrigues Santos on 24/10/19.
//  Copyright © 2019 Mateus Rodrigues Santos. All rights reserved.
//

import Foundation
import SpriteKit

class PecaCT:SKSpriteNode,Peca {
    var cor: UIColor
    
    var nomeCor: String
    
    init(scene:SKScene,cor:UIColor,nomeCor:String,nomeVerdadeiro:String) {
        self.cor = cor
        self.nomeCor = nomeCor
        let texto = SKLabelNode(fontNamed: "Arial")
        texto.text = self.nomeCor
        if self.cor == UIColor.black{
            texto.fontColor = .white
        }else{
            texto.fontColor = .black
        }
        texto.fontSize = 30
        texto.position = CGPoint(x: 0, y: -10)
        texto.zPosition = 0
        texto.name = nomeVerdadeiro
        
        super.init(texture: nil, color: self.cor, size: CGSize(width: 130, height: 50))
        self.color = self.cor
        self.position = posicaoAleatoria(cena: scene)
        self.name = nomeVerdadeiro
        self.zPosition = 10
        self.addChild(texto)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func desaparecer() {
        self.removeFromParent()
    }
}

func posicaoAleatoria(cena: SKScene) -> CGPoint{
    let randomPosition = CGPoint(x: 0, y: CGFloat.random(in: cena.size.height*0.4..<350))
    return randomPosition
}
