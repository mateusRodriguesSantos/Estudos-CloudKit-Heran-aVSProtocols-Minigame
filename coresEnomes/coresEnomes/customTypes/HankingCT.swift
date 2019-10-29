//
//  HankingCT.swift
//  coresEnomes
//
//  Created by Mateus Rodrigues Santos on 24/10/19.
//  Copyright © 2019 Mateus Rodrigues Santos. All rights reserved.
//

import Foundation

struct HackingCT:Hanking {
    
    var Jogadores: [Jogador]
    
    init(jogadores:[Jogador]) {
        self.Jogadores = jogadores
    }
    
    func montarScore() -> [String : Int] {
        let dicionario = [String : Int]() as! NSMutableDictionary
        var listaOrdenada = [Jogador]()
        
        for i in 0...self.Jogadores.count{
            if self.Jogadores[i].pontos > self.Jogadores[i+1].pontos{
                listaOrdenada.append(self.Jogadores[i])
            }
        }
        
        for jogador in listaOrdenada{
            dicionario[jogador.nome] = jogador.pontos
        }
        
        return dicionario as! [String : Int]
    }
}
