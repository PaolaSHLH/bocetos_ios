//
//  mono_chino.swift
//  RedesSociales
//
//  Created by alumno on 4/4/25.
//
import SwiftUI

struct MonoChino: Identifiable, Codable{
    let id: Int
    let name: String
    let ki: String
    let maxKi: String
    let race:String
    let gender: String
    let description: String
    let image: String
    let affiliation:String
    let originPlanet: Planeta?
    let transformations: [Transformacion]?
}
