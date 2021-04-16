//
//  ContentView.swift
//  Cazu_iPhone
//
//  Created by Gustavo Anjos on 13/04/21.
//

import SwiftUI
import SceneKit
import UIKit

struct DashboardView: View {
    
    var tasks: [Task] = tasksSorted
    
    var body: some View {
        
        ZStack{
            
            Color.black.ignoresSafeArea()
            
            VStack{
                Text("LVL 5")
                    .foregroundColor(Color(#colorLiteral(red: 0.4666666667, green: 0.4862745098, blue: 0.968627451, alpha: 1)))
                    .font(.system(size: 18, weight: .bold, design: .default))
                    .padding()
                
                SceneView(
                    scene: scene,
                    pointOfView: cameraNode,
                    options: [
                        .allowsCameraControl,
                        .autoenablesDefaultLighting
                    ]
                ).frame(width: 375, height: 270, alignment: .center)
                
                HStack{
                    Text("Atividades recentes")
                        .foregroundColor(Color(#colorLiteral(red: 0.4666666667, green: 0.4862745098, blue: 0.968627451, alpha: 1)))
                        .font(.system(size: 17, weight: .bold, design: .default))
                        .padding()
                    
                    Spacer()
                }
                
                ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false){
                    ForEach(tasks) { task in
                        TaskRowView(task: task)
                    }
                }
                
                Spacer()
                
            }
            
        }
        
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView().background(Color.black).ignoresSafeArea(.all)
    }
}
