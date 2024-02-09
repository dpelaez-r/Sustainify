//
//  ContentView.swift
//  Empresa Certificaciones
//
//  Created by Daniel Peláez on 06/02/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            VStack(spacing: 25){
                HStack (spacing: 70) {
                    Image(systemName: "chevron.backward")
                        .frame(width: 50, height: 50)
                    
                    Text("Asesores")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Image("logo1")
                }
                Spacer()
                Text("Certificacion LEED")
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
                
                    
                Text("La Certificación LEED (Liderazgo en Energía y Diseño Ambiental, por sus siglas en inglés) es un sistema de certificación con reconocimiento internacional para edificios sustentables creado por el Consejo de Edificación Sustentable de Estados Unidos (U.S. Green Building Council). ")
                    .font(.footnote)
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.center)
                    .frame(width: 330, height: 180)
                    
                Text("Beneficios de esta certificación")
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
                
                Text("Espacios con mejores condiciones para la salud y productividad. Reducción de emisiones de gases de efecto invernadero. Acceso a incentivos fiscales. Disminución en los costos de operación y residuos. Incremento del valor de sus activos. Ahorro energético y de recursos.")
                    .font(.footnote)
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.center)
                    .frame(width: 330, height: 180)
                
                Button {
                    print("tapped")
                } label: {
                    Text("Ir ahora")
                        .foregroundColor(Color.gray)
                        .frame(width: 200, height: 50)
                        .background(Color("lightGray"))
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .cornerRadius(20)
                }
                Spacer()
                HStack(spacing: 45){
                    Image(systemName: "newspaper")
                    Image(systemName: "person.3")
                    Image(systemName: "house")
                    Image(systemName: "list.number")
                    Image(systemName: "person")
                }
                .padding(.bottom)
            }
            .ignoresSafeArea()
            .padding(.top)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
