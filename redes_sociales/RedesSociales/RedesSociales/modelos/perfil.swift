//
//  perfil.swift
//  RedesSociales
//
//  Created by alumno on 28/3/25.
//

struct Perfil: Codable, Identifiable{
    let id: Int
    
    let name: String
    let username: String
    
    let email: String
    let phone: String
}
