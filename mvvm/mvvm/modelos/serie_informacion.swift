//
//  aqui_guarda_sus_modelos.swift
//  mvvm
//
//  Created by alumno on 14/3/25.
//
import Foundation

struct Temporada{
    var nombre: String
    var cantidadCap: Int
}

struct Plataforma{
    var nombre: String
    var icono : String
}

struct InformacionSerie : Identifiable{
    var id:
    
    var nombre: String
    var tipo: String
    
    var plataformas : [Plataforma] = [] // aqui tengo una deuda tecnica para indicar otras platarformas de manera mas sencilla
    
    var fechaEstreno: Int
    var sinopsis: String
    
    var temporadas: [Temporada] = []
    
    var caratula: String
}
