//
//  GameViewController.swift
//  coresEnomes
//
//  Created by Mateus Rodrigues Santos on 24/10/19.
//  Copyright © 2019 Mateus Rodrigues Santos. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import CloudKit

class GameViewController: UIViewController,UITextFieldDelegate {
    var nomes = [String]()
    var nomesVerificacao = [String]()
    let privateDatabase = CKContainer(identifier: "iCloud.Mateus.CoresEnomes.HanckingGame2").privateCloudDatabase
    
    @IBOutlet weak var nomeTexto: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nomeTexto.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if busca() == false{
            if segue.identifier == "nomeJogador" {
                let controller = segue.destination as! ViewController
                controller.nome = nomeTexto.text ?? "indefinido"
            }
        }
    }
    
    func busca() -> Bool{
        var achou = Int()
        achou = 0
        let predicate = NSPredicate(value: true)
        
        let query = CKQuery(recordType: "Jogador", predicate: predicate)

        let operation = CKQueryOperation(query: query)
        
        self.nomes.removeAll()
        
        operation.recordFetchedBlock = { record in
            self.nomes.append(record["nome"]!)
            self.nomesVerificacao.append(record["nome"]!)
        }
        
        operation.queryCompletionBlock = { cursor, error in
            
            DispatchQueue.main.async {
                print("Nome: \(self.nomes)")
                     
                for nome in self.nomesVerificacao{
                   if nome == self.nomeTexto.text{
                       achou = 1
                      }
                  }
                }
            
        }
        
        if achou == 1{
               let alert1 = UIAlertController(title: "ERRO!!!", message: "Esse nome já existe!!!", preferredStyle: .alert)
               let opAlerta1 = UIAlertAction(title: "Sair", style: .default) { (ok) in
                   print("ok")
               }
               alert1.addAction(opAlerta1)
            self.present(alert1, animated: false, completion: nil)
            privateDatabase.add(operation)
            return true
        }else{
            privateDatabase.add(operation)
            return false
        }
    }
    
//    func verificaNomeRepetido() -> Bool{
//        busca()
//        print("Nome da função: \(self.nomesVerificacao)")
//
//        for nome in self.nomesVerificacao{
//            if nome == self.nomeTexto.text{
//                   let alert1 = UIAlertController(title: "ERRO!!!", message: "Esse nome já existe!!!", preferredStyle: .alert)
//                   let opAlerta1 = UIAlertAction(title: "Sair", style: .default) { (ok) in
//                       print("ok")
//                   }
//                   alert1.addAction(opAlerta1)
//                self.present(alert1, animated: true, completion: nil)
//
//                return true
//               }
//           }
//        return false
//    }
    
}
