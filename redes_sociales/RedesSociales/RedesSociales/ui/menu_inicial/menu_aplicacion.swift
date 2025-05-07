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
                .tabItem {Label("Dragon Ball DB", systemImage : "person.bust")
                    }
            
            pantallasListaPlanetas()
                .tabItem { Label("Planetas", systemImage: "moon.stars")
                }
            PerfilBasicovista()
                .tabItem { Label("Usuario", systemImage: "person")
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
