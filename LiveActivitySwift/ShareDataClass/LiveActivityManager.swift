//
//  LiveActivityManager.swift
//  LiveActivitySwift
//
//  Created by Appsquadz on 29/08/24.
//

import Foundation
import ActivityKit

final class LiveActivityManager {
    static let shared = LiveActivityManager()
    private var currentLiveActivitiesArray = [Activity<StopwatchAttributes>]()
        var isLiveActivityUpdateOnce = false
    
    // MARK: - CREATE
    func createLiveActivityRequest(){
        let orderAttributes = StopwatchAttributes(tripNumber: 0123)
        let initialState = StopwatchAttributes.ContentState(tripStatus: .rideBooked, currentTripNumber: 1)
        let activityContent = ActivityContent(state: initialState.self, staleDate: nil)
        
        do {
            let activity = try ActivityKit.Activity.request(attributes: orderAttributes, content: activityContent, pushType: nil)
            currentLiveActivitiesArray.append(activity)
        } catch {
            print("Error In Creating A live Activity",error.localizedDescription)
        }
    }
    // MARK: - UPDATE
    
    func updateLiveActivity(to status : TripState) async {
        guard let activity = currentLiveActivitiesArray.first(where: { $0.attributes.tripNumber == 0123}) else { return }
        let updateState = StopwatchAttributes.ContentState(tripStatus: status)
        let updateContent = ActivityContent(state: updateState.self, staleDate: nil)
        let alertConfig = AlertConfiguration(title: "Updateing The Live Activity", body: "Helo", sound: .default)
        await activity.update(updateContent,alertConfiguration: alertConfig)
        
        isLiveActivityUpdateOnce = true
    }
    
    // MARK: - END
    func endLiveActivity() async {
        guard let activity = currentLiveActivitiesArray.first(where: { $0.attributes.tripNumber == 0123}) else {return}
        let updateState = StopwatchAttributes.ContentState(tripStatus: .tripEnded)
        let updateContent = ActivityContent(state: updateState.self, staleDate: nil)
        await activity.end(updateContent, dismissalPolicy: .after(Date() + 5))
        
        isLiveActivityUpdateOnce = false
        currentLiveActivitiesArray.removeAll()
        
    }
    
    func stimulatActivityRequest() {
        createLiveActivityRequest()
        Task {
            try await Task.sleep(nanoseconds:2_000_000_000)
            await updateLiveActivity(to: .abouttoickup)
            try await Task.sleep(nanoseconds: 2_000_000_000)
            await updateLiveActivity(to: .tripOntheway)
        }
    }
    
}
