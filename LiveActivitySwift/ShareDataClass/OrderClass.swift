//
//  OrderClass.swift
//  LiveActivitySwift
//
//  Created by Appsquadz on 29/08/24.
//

import ActivityKit

struct StopwatchAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        let tripStatus : TripState
        var currentTripNumber : Int
        
        init(tripStatus: TripState, currentTripNumber: Int = 0) {
            self.tripStatus = tripStatus
            self.currentTripNumber = currentTripNumber
        }
    }
    let tripNumber  : Int

}

enum TripState : Float ,Codable ,Hashable {
    case rideBooked = 1
    case abouttoickup
    case tripOntheway
    case tripEnded
    
    var descripation : String {
        switch self {
        case .rideBooked:
            return "Your Ride Booked"
        case .abouttoickup:
            return "Your Ride ToPickup"
        case .tripOntheway:
            return "Your Ride Ontheway"
        case .tripEnded:
            return "Your Ride Ended"
        }
    }
    static var allCases : [TripState] {
        [.rideBooked , .abouttoickup ,.tripOntheway ,.tripEnded]
    }
}
