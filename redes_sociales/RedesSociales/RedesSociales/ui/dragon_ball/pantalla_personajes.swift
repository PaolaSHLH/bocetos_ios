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
        NavigationStack{
            
            ScrollView{
                LazyVStack(spacing: 20){
                    Text("Dragon ball")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    if(controlador.pagina_resultados != nil){
                        ForEach(controlador.pagina_resultados!.items){ personaje in
                            NavigationLink{
                                pantallaDescripcion()
                            } label:{
                                VStack{
                    
                                    HStack{
                                        
                                        
                                        AsyncImage(url: URL(string: personaje.image)){imagen in
                                            imagen.image?
                                                .resizable()
                                                .scaledToFit()
                                                
                                        }.frame(width: 150, height: 200)
                                        
                                        VStack{
                                            Text("\(personaje.name)")
                                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                            
                                            Text("\(personaje.race)")
                                            Text("\(personaje.gender)")
                                            
                                        }
                                        
                                    }
                                    .font(.subheadline)
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .cornerRadius(12)
                                .foregroundColor(.white)
                            }/* Aqui termina el Nav link*/
                            .simultaneousGesture(TapGesture().onEnded({
                                 controlador.seleccionar_personaje(personaje)
                                /*controlador.descargar_informacion_personaje(id: personaje.id)*/
                                  }))
                            .padding()
                        }/* Aqui termina el ForEach*/
                    }/* Aqui termina el if*/
                }/* Aqui termina el lazyVstack*/
            }/* Aqui termina el scrollView*/
            .background(Color.orange)
        }/* Aqui termina el Nav stack*/
        
    }
}

#Preview {
    PantallaPersonajes()
        .environment(ControladorAplicacion())
}
