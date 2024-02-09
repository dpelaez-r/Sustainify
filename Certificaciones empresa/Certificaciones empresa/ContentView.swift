//
//  ContentView.swift
//  Certificaciones empresa
//
//  Created by Daniel Peláez on 07/02/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack (spacing: 70) {
                Image(systemName: "chevron.backward")
                    .frame(width: 50, height: 50)
                
                Text("Asesores")
                    .font(.title)
                    .fontWeight(.bold)
                
                Image("logo1")
            }
            
        }
        ignoresSafeArea()
       // .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
