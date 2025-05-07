//
//  pantallas_lista_planetas.swift
//  RedesSociales
//
//  Created by alumno on 2/5/25.
//

import SwiftUI

struct pantallasListaPlanetas: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        
        NavigationStack{
            ScrollView{
                LazyVStack(spacing: 20){
                    Text("Planetas")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding()
                        
                        
                    if(controlador.lista_de_planetas != nil){
                        ForEach(controlador.lista_de_planetas!.items){ planeta in
                            NavigationLink{
                                pantallaDescPlanetas()
                            } label:{
                                VStack{
                    
                                    HStack{
                                        
                                        
                                        AsyncImage(url: URL(string: planeta.image)){imagen in
                                            imagen.image?
                                                .resizable()
                                                .scaledToFit()
                                                .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                                                
                                        }.frame(width: 150, height: 200)
                                        
                                        VStack{
                                            Text("\(planeta.name)")
                                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                            
                                            
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
                                controlador.seleccionar_planeta(planeta)
                            }))
                            .padding()
                        }/* Aqui termina el ForEach*/
                    }/* Aqui termina el if*/
                    /*else {
                        Text("No se han descargado. Descargando")
                            .onAppear{
                                Task {
                                    await controlador.descargar_planetas()
                                }
                            
                            }
                    }*/
                    
                }/* Aqui termina el lazyVstack*/
            }/* Aqui termina el scrollView*/
            .background(Color.orange)
            
        }
        
        
        }
    }


#Preview {
    pantallasListaPlanetas()
        .environment(ControladorAplicacion())
}
