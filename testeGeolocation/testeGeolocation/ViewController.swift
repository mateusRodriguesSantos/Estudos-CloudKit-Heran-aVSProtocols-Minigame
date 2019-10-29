//
//  ViewController.swift
//  testeGeolocation
//
//  Created by Mateus Rodrigues Santos on 10/10/19.
//  Copyright © 2019 Mateus Rodrigues Santos. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate,MKMapViewDelegate {
    
    var regionRadius:CLLocationDistance?
    var initialLocation = CLLocation()
    var salvarPosicaoInicial = Bool()
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var texto: UILabel!
    
    //MARK: Estancio o gerente de localizacao
    var locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: Verificando se o device suporta a geolocalizacao
        if CLLocationManager.significantLocationChangeMonitoringAvailable(){
            mapView.showsUserLocation = true
            self.locationManager.delegate = self
            ///Altorização quando em uso
            self.locationManager.requestWhenInUseAuthorization()
             ///Altorização sempre
            //self.locationManager.requestAlwaysAuthorization()
            
            //A distância mínima (medida em metros) que um dispositivo deve mover horizontalmente antes que um evento de atualização seja gerado.
            self.locationManager.distanceFilter = 1//Medida em metros
            self.locationManager.desiredAccuracy = kCLLocationAccuracyBest//Precisão desejada
            //Apresento a localização
            self.texto.text = self.locationManager.location?.description
            ///Para economizar bateria digo que a atualização deve parar, quando o usuário parar significativamente
            self.locationManager.pausesLocationUpdatesAutomatically = true
            
           //Localização inicial
        
            let regiao = MKCoordinateRegion.init(center: self.locationManager.location?.coordinate ?? CLLocationCoordinate2D(latitude: CLLocationDegrees.zero, longitude: CLLocationDegrees.zero), latitudinalMeters: 100, longitudinalMeters: 100)
            mapView.setRegion(regiao, animated: true)
//            mapView.showsUserLocation = true
            self.salvarPosicaoInicial = true

        }else{
            alert2.addAction(opAlerta2)
            self.addChild(alert2)
        }
    }
    
    
    //MARK: método do delegate para tratar as atualizações de localização
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       let localAtual = locations.last
        if self.locationManager.location != localAtual {
            print(localAtual as Any)
            self.texto.text = localAtual?.description
            
            if self.salvarPosicaoInicial == true{
                self.initialLocation = localAtual!
                self.salvarPosicaoInicial = false
                //Setando localização inicial
                let annt = MKPointAnnotation()
                annt.coordinate = localAtual!.coordinate
                annt.title = "Minha localização"
                annt.subtitle = "Parada"
                mapView.addAnnotation(annt)
                
                let regiao = MKCoordinateRegion.init(center: localAtual?.coordinate ?? CLLocationCoordinate2D(latitude: CLLocationDegrees.zero, longitude: CLLocationDegrees.zero), latitudinalMeters: 1000, longitudinalMeters: 1000)
                mapView.setRegion(regiao, animated: true)
            }
            
        }
    }
    
    //MARK: tratando as annotations, para não precisar instancia-las sempre
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "Annotation")
        
        if annotationView == nil{
            annotationView = MKMarkerAnnotationView(annotation: annotation,reuseIdentifier: "Annotation")
        }else{
            annotationView?.annotation = annotation
        }
        annotationView?.canShowCallout = true
        
        return annotationView
    }
    
    
    //MARK: método do delegate para erros na atualização da localização
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        if let error = error as? CLError, error.code == .denied {
            self.locationManager.stopUpdatingLocation()
           return
        }
    }
    
    //MARK: método do delegate para verificar erros
    func locationManager(_ manager: CLLocationManager, monitoringDidFailFor region: CLRegion?, withError error: Error) {
        alert1.addAction(opAlerta1)
        self.addChild(alert1)
    }
    
    //MARK: Método para tratar as alterações de estado de alteração da autorização
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        //MARK: Tratando a alteração nos status de altorização
        
        switch status {
           /// Desabilita as features de localização, quando o acesso for restrito
        case .restricted:
                print("Autorização restrita!!!")
                /// Habilito as features de localização, quando o acesso for negado
                self.locationManager.stopUpdatingLocation()
            break;
        case .authorizedWhenInUse:
                /// Habilito as features de localização, quando o acesso for quando em uso
                self.locationManager.startUpdatingLocation()
                print("Autorização definida, quando em uso!!!")
            break;
        case .authorizedAlways:
                /// Habilito as features de localização, quando o acesso for sempre
                self.locationManager.startUpdatingLocation()
                print("Autorização definida, sempre!!!")
            break;
        default:
            print("Autorização não definida!!!")
        }
    }


}

