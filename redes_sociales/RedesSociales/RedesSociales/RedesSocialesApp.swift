//
//  RedesSocialesApp.swift
//  RedesSociales
//
//  Created by alumno on 24/3/25.
//

import SwiftUI

@main
@MainActor
struct RedesSocialesApp: App {
    @State var controlador = ControladorAplicacion()
    
    
    var body: some Scene {
        WindowGroup {
            MenuNavegacion()
                .environment(controlador)
        }
    }
}
