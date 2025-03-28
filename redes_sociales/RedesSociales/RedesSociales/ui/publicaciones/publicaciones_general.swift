//
//  publicaciones_general.swift
//  RedesSociales
//
//  Created by alumno on 24/3/25.
//

import SwiftUI

struct GenerarPublicaciones : View {
   // @StateObject var controlador = ControladorPublicaciones()
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View{
        NavigationStack{
            ScrollView{
                VStack{
                    ForEach(controlador.publicaciones){ publicacion in
                        NavigationLink{
                            PublicacionVista()
                        }label: {
                            HStack{
                                
                                VStack{
                                    Spacer()
                                    Text("\(publicacion.id)")
                                    Spacer()
                                    Text("\(publicacion.title)")
                                    Text("\(publicacion.body)")
                                }
                            }
                        }.simultaneousGesture(TapGesture().onEnded({
                            controlador.seleccionar_publicacion(publicacion)                            }))
                    }
                }
            }
        }
            .onAppear{
                /*if controlador.publicaciones.isEmpty {
                    Task{
                        await controlador.obtener_publicaciones()
                }*/
                print("no se")
            }
        }
    }


#Preview {
    GenerarPublicaciones()
        .environment(ControladorAplicacion())
}
