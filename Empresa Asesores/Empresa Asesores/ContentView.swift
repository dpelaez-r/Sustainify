//
//  ContentView.swift
//  Empresa Asesores
//
//  Created by Daniel Peláez on 05/02/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack {
                HStack (spacing: 70) {
                    Image(systemName: "chevron.backward")
                        .frame(width: 50, height: 50)
                    
                    Text("Asesores")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Image("logo1")
                }
                Image("graySquare")
                    .frame(width: 250, height: 250)
                
                Text("Asesor Javier")
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
                    .frame(width: 200, height: 20)
                   
                Text("Asesor Javier Asesor Javier Asesor Javier Asesor Javier Asesor Javier Asesor Javier Asesor Javier Asesor Javier")
                    .foregroundColor(Color.gray)
                    .frame(width: 250, height: 120)
                Spacer()
                Button{
                    print("tapped")
                } label: {
                    Text("Contratar")
                        .foregroundColor(.gray)
                        .frame(width: 200, height: 50)
                        .background(Color("lightgray"))
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .cornerRadius(20)
                }
                Spacer()
                HStack(spacing: 35){
                    Image("Noticias")
                    Image("Foro")
                    Image("Inicio")
                    Image("Ranking")
                    Image("Perfil")
                }
                .padding(.bottom, 50)

            }
            .padding(.top, 70)
            .ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
