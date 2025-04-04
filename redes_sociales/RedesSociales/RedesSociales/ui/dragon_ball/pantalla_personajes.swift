//
//  pantalla_personajes.swift
//  RedesSociales
//
//  Created by alumno on 4/4/25.
//

import SwiftUI

struct PantallaPersonajes: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        ScrollView{
            LazyVStack(spacing: 20){
                if(controlador.pagina_resultados != nil){
                    ForEach(controlador.pagina_resultados!.items){ personaje in
                        Text("\(personaje.name)")
                        AsyncImage(url: URL(string: personaje.image)){imagen in
                            imagen.image?
                                .resizable()
                                .scaledToFit()
                                
                        }.frame(width: 150, height: 200)
                            
                        
                        HStack{
                            Text("\(personaje.race)")
                            Text("\(personaje.gender)")
                        }
                        .font(.subheadline)
                    }
                   
                    
                }
                
            }
        }
    }
}

#Preview {
    PantallaPersonajes()
        .environment(ControladorAplicacion())
}
