//
//  LiveActivityView.swift
//  LiveAllDataExtension
//
//  Created by Appsquadz on 29/08/24.
//

import SwiftUI
import WebKit


struct LiveActivityView: View {
    let state : StopwatchAttributes.ContentState
    let isDynamicIsLandView :Bool = false
    let isDynamicIslandView: Bool = false
    
    var body: some View {
        VStack {
            Text("Pick Me Up!")
                .font(.system(size: 16,weight: .semibold))
                .foregroundColor(isDynamicIsLandView ? .white : .blue)
                .padding(.top, 5)
            HStack {
                Image(systemName: "car.front.waves.up.fill")
                    .foregroundColor(isDynamicIsLandView ? .white : .blue)
                ProgresserView(currentStateView: Int(state.tripStatus.rawValue), totalStatusCount: TripState.allCases.count)
                    Image(systemName: "car")
                    .foregroundColor(isDynamicIsLandView ? .white :  .blue)
            }
            .padding(isDynamicIsLandView ? .zero : 16)
            Text("\(state.tripStatus.descripation)")
                .font(.system(size: 16,weight: .semibold))
                .foregroundColor(isDynamicIsLandView ? .white : .blue)
                .padding(.top, 5)
            Spacer()
        }
    }
}

