//
//  menu_aplicacion.swift
//  RedesSociales
//
//  Created by alumno on 31/3/25.
//

import SwiftUI

struct MenuNavegacion: View{
    @Environment(ControladorAplicacion.self) var controlador
    var body: some View{
        TabView{
            GenerarPublicaciones()
                .tabItem { Label("Es esta pantalla", systemImage: "house")
                }
                .badge(controlador.publicaciones.count)
            
            PantallaPersonajes()
                .tabItem {
                    Label{
                    Text("Dragon Ball DB")
            
                    } icon: {
                        Circle()
                            .frame(width: 44, height: 44,
                                alignment: .center)
                            .overlay(Text("s"))
                    }
                }
            
            Text("Hola desde pantalla 3")
                .tabItem { Label("Etiqueta de esta label", systemImage: "trash")
                }
          /*  Tab("Etiqueta", systemImage : "perfil"){
                Text("Referencia a la pantalla")
            }*/
        }
    }
}

#Preview {
    MenuNavegacion()
        .environment(ControladorAplicacion())
}
