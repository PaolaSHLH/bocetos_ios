//
//  vista_modelo_basico.swift
//  mvvm
//
//  Created by alumno on 14/3/25.
//

import Foundation

@Observable
class VistaModeloBasico{
    var series_registradas: Array<InformacionSerie> = []
    
    func agregar_serie() -> Void{
        print("holamundo desde el conrtolador")
        series_registradas.append(InformacionSerie(nombre: "Prueba", tipo: "prueba", fechaEstreno: 2017, sinopsis: "inserte sinopsis rara y larga aqui", caratula: "imagenjsjsj"))
        
    }
}
