//
//  ProgressView.swift
//  LiveAllDataExtension
//
//  Created by Appsquadz on 29/08/24.
//

import SwiftUI

struct ProgresserView: View {
    @State private var containarWidth : CGFloat = 0
    let currentStateView : Int
    let totalStatusCount : Int
    
    var maxWidth : Double {
        return min(containarWidth / CGFloat(totalStatusCount) * CGFloat(currentStateView) , containarWidth)
    }
    
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                GeometryReader { geo in
                    RoundedRectangle(cornerRadius: 60.0)
                        .foregroundColor(.clear)
                        .onAppear{
                            containarWidth = geo.size.width
                        }
                }
                RoundedRectangle(cornerRadius: 60.0)
                    .stroke(Color.purple ,lineWidth: 1)
                
                ZStack(alignment: .trailing ) {
                    RoundedRectangle(cornerRadius: 60.0)
                        .fill(Color.purple)
                    Image(systemName: "car.size")
                        .font(.system(size: 25))
                        .scaleEffect(x : -1,y: 1)
                        .foregroundColor(.white)
                    
                }
                .frame(width: maxWidth)  // Use maxWidth here
                .fixedSize()
                
            }
            .fixedSize(horizontal : false , vertical : true)
            .padding(.zero)
            
        }
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgresserView(currentStateView: 2, totalStatusCount: 5)
            .frame(width: 300, height: 100)
            .padding()
    }
}
