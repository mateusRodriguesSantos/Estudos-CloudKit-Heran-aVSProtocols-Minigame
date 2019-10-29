//
//  ViewController.swift
//  cloudKitDemo
//
//  Created by Mateus Rodrigues Santos on 23/10/19.
//  Copyright © 2019 Mateus Rodrigues Santos. All rights reserved.
//

import UIKit
import CloudKit

class ViewController: UIViewController {
    
    let privateDatabase = CKContainer(identifier: "iCloud.com.mateusRodrigues.TESTE").privateCloudDatabase

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func saveBtn(_ sender: Any) {
        let nomeText = self.textField.text
        
        let record = CKRecord(recordType: "nomes")
        
        record.setValue(nomeText, forKey: "nome")
        
        self.privateDatabase.save(record) { (savedRecord, error)  in
            if error == nil {
              print("Record Saved")
            } else {
                print("Record Not Saved")
            }
        }
    }
    
    @IBAction func retrieveBtn(_ sender: Any) {
        let predicate = NSPredicate(value: true)
        
        let query = CKQuery(recordType: "nomes", predicate: predicate)

        let operation = CKQueryOperation(query: query)
        
        nome.removeAll()
        recordIDs.removeAll()
        
        operation.recordFetchedBlock = { record in
            
            nome.append(record["nome"]!)
            recordIDs.append(record.recordID)
            
        }
        
        operation.queryCompletionBlock = { cursor, error in
            
            DispatchQueue.main.async {
                
                print("Nome: \(nome)")
                print("RecordIDs: \(recordIDs)")
                
            }
            
        }
        
        privateDatabase.add(operation)
    }
    
    @IBAction func updateBtn(_ sender: Any) {
        let newName = "Alterado"
        
        let recordID = recordIDs.first!
        
        privateDatabase.fetch(withRecordID: recordID) { (record, error) in
            
            if error == nil {
                
                record?.setValue(newName, forKey: "nome")
                
                self.privateDatabase.save(record!, completionHandler: { (newRecord, error) in
                    
                    if error == nil {
                        
                        print("Record Saved")
                        
                    } else {
                        
                        print("Record Not Saved")
                        
                    }
                    
                })
                
            } else {
                
                print("Could not fetch record")
                
            }
            
        }

    }
    
    @IBAction func deleteBtn(_ sender: Any) {
        let recordID = recordIDs.first!
        
        privateDatabase.delete(withRecordID: recordID) { (deletedRecordID, error) in
            
            if error == nil {
                
                print("Record Deleted")
                
            } else {
                
                print("Record Not Deleted")
                
            }
            
        }
    }
    
}

