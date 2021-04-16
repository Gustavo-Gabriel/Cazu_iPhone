//
//  TaskRowView.swift
//  Cazu_iPhone
//
//  Created by Gustavo Anjos on 13/04/21.
//

import SwiftUI

struct TaskRowView: View {
    
    var task: Task
    
    var body: some View {
        
        ZStack{
            Rectangle()
                .foregroundColor(Color(#colorLiteral(red: 0.4666666667, green: 0.4862745098, blue: 0.968627451, alpha: 0.1954203413)))
                .cornerRadius(10.0)
                .frame(width: 359, height: 94, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            VStack{
                HStack{
                    Circle()
                        .frame(width: 10, height: 10, alignment: .center)
                        .foregroundColor(Color(task.status.getColor()))
                    
                    Text(task.status.getStatus())
                        .font(.system(size: 12, weight: .regular, design: .default))
                        .foregroundColor(Color(task.status.getColor()))
                    
                    Spacer()
                    
                    Text(task.horarioInicial)
                        .font(.system(size: 12, weight: .regular, design: .default))
                        .foregroundColor(Color(#colorLiteral(red: 0.4666666667, green: 0.4862745098, blue: 0.968627451, alpha: 1)))
                    
                    HorarioLoader()
                    
                    Text(task.horarioFinal)
                        .font(.system(size: 12, weight: .regular, design: .default))
                        .foregroundColor(Color(#colorLiteral(red: 0.4666666667, green: 0.4862745098, blue: 0.968627451, alpha: 1)))
                    
                }
                .padding()
                
                HStack{
                    Text(task.descricao)
                        .font(.system(size: 14, weight: .regular, design: .default))
                        .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                        .padding(.top, -10)
                    
                    
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                if task.status == TaskStatus.emAndamento {
                    ProgressBar(value: Double.random(in: 0...100), maxValue: 100)
                        .padding(.horizontal)
                }
                
                Spacer()
            }
            
        }
        
    }
    
    private func progress(value: Double,
                          maxValue: Double,
                          width: CGFloat) -> CGFloat {
        let percentage = value / maxValue
        return width *  CGFloat(percentage)
    }
}

struct TaskRowView_Previews: PreviewProvider {
    static var previews: some View {
        TaskRowView(task: data[0])
    }
}
