//
//  GameScene.swift
//  coresEnomes
//
//  Created by Mateus Rodrigues Santos on 24/10/19.
//  Copyright © 2019 Mateus Rodrigues Santos. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit
import CloudKit

var nomeJogador = String()
var acerto = Int()
var erro = Int()

class GameScene: SKScene {
    
    let delegateAnimacao = AnimationDelegate()
    
    var nomeSorteado = String()
    
 
    
    var Qtderro = SKLabelNode()
    var Qtdacerto = SKLabelNode()
    
    override func didMove(to view: SKView) {
        backgroundColor = .white
        self.name = "fundo"
        
        acerto = 0
        erro = 0
        
        delegateAnimacao.spawnPecas(scene: self)
        self.nomeSorteado = sorteiaCor()
        
        let nomePlayer = SKLabelNode(fontNamed: "Arial")
        nomePlayer.text = nomeJogador
        nomePlayer.fontColor = .darkGray
        nomePlayer.fontSize = 30
        nomePlayer.position = CGPoint(x: self.size.width/2, y: self.size.height*0.9)
        self.addChild(nomePlayer)
             
        
        let texto = SKLabelNode(fontNamed: "Arial")
        texto.text = self.nomeSorteado
        texto.fontColor = .black
        texto.fontSize = 30
        texto.position = CGPoint(x: self.size.width/2, y: 40)
        self.addChild(texto)
        
        let acerto = SKLabelNode(fontNamed: "Arial")
        acerto.text = "Acertos: "
        acerto.fontColor = .black
        acerto.fontSize = 30
        acerto.position = CGPoint(x: self.size.width*0.84, y: 40)
        self.addChild(acerto)
        
        let erro = SKLabelNode(fontNamed: "Arial")
        erro.text = "Erros: "
        erro.fontColor = .black
        erro.fontSize = 30
        erro.position = CGPoint(x: self.size.width*0.15, y: 40)
        self.addChild(erro)
        
        Qtderro = SKLabelNode(fontNamed: "Arial")
        Qtderro.text = "0"
        Qtderro.fontColor = .black
        Qtderro.fontSize = 30
        Qtderro.position = CGPoint(x: self.size.width*0.24, y: 40)
        self.addChild(Qtderro)
        
        Qtdacerto = SKLabelNode(fontNamed: "Arial")
        Qtdacerto.text = "0"
        Qtdacerto.fontColor = .black
        Qtdacerto.fontSize = 30
        Qtdacerto.position = CGPoint(x: self.size.width*0.95, y: 40)
        self.addChild(Qtdacerto)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch?.location(in: self)
        let noTouch = self.atPoint(touchLocation!)
        
        if noTouch.name == self.nomeSorteado || noTouch.parent?.name == self.nomeSorteado{
            if noTouch.parent?.name == self.nomeSorteado{
                noTouch.parent?.removeFromParent()
            }else{
                noTouch.removeFromParent()
            }
            
            acerto = acerto+1
            self.Qtdacerto.text = "\(acerto)"
            self.speed = self.speed + 0.3
        }else{
            if noTouch.name != "fundo"{
                erro = erro+1
                self.Qtderro.text =  "\(erro)"
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        if  erro >= 20{
            self.removeAllChildren()
            self.removeAllActions()
            self.view?.presentScene(GameOverCongratulations(size: self.size))
        }
        
        if acerto >= 50{
            self.removeAllChildren()
            self.removeAllActions()
            self.view?.presentScene(GameOverCongratulations(size: self.size))
        }
    }
}

func sorteiaCor() -> String {
    var cor = String()
    let num = Int(arc4random_uniform(9))
         switch num {
         case 0:
             cor = "Amarelo"
         case 1:
             cor = "Azul"
         case 2:
             cor = "Preto"
         case 3:
             cor = "Verde"
         case 4:
             cor = "Vermelho"
         case 5:
             cor = "Marrom"
         case 6:
             cor = "Azulado"
         case 7:
             cor = "Laranja"
         case 8:
             cor = "Magenta"
         default:
             print("Não definiu a cor")
         }
    return cor
}
