//
//  LiveAllDataLiveActivity.swift
//  LiveAllData
//
//  Created by Appsquadz on 29/08/24.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct LiveAllDataLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: StopwatchAttributes.self) { context in
            // Lock screen/banner UI goes here
            LiveActivityView(state: context.state)

        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.leading) {
                    Image(systemName: "map.circle")
                        .foregroundColor(.white)
                        .padding(.top, 5)
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Image(systemName: "map.circle")
                        .foregroundColor(.white)
                        .padding(.top, 5)
                }
                DynamicIslandExpandedRegion(.bottom) {
                   // LiveActivityView(state: context.state, isDynamicIslandView: true)
                }
            } compactLeading: {
                Image(systemName: "map.circle")
                    .scaledToFit()
                    .foregroundColor(.white)
            } compactTrailing: {
                Image(systemName: "map.circle")
                    .scaledToFit()
                    .foregroundColor(.white)
            } minimal: {
                Image(systemName: "map.circle")
                    .foregroundColor(.white)
            }
        }
    }
}
