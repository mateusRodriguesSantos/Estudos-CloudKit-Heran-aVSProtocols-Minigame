//
//  ViewController.swift
//  coresEnomes
//
//  Created by Mateus Rodrigues Santos on 25/10/19.
//  Copyright © 2019 Mateus Rodrigues Santos. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class ViewController: UIViewController {
    var nome = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nomeJogador = self.nome
        if let view = self.view as! SKView? {
             // Load the SKScene from 'GameScene.sks'
            let scene = GameScene(size: view.frame.size)
             // Set the scale mode to scale to fit the window
             scene.scaleMode = .aspectFill
             
             // Present the scene
             view.presentScene(scene)
         
             
             view.ignoresSiblingOrder = true
             
//             view.showsFPS = true
//             view.showsNodeCount = true
         }
    }
    

}
