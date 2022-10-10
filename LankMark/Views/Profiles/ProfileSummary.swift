//
//  ProfileSummary.swift
//  LankMark
//
//  Created by 최준영 on 2022/10/10.
//

import SwiftUI

struct ProfileSummary: View {
    @EnvironmentObject var modelData: ModelData
    
    var profile: Profile
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(profile.username)
                    .bold()
                    .font(.title)
                Text("Notification: \(profile.prefersNotifications ? "On" : "Off")")
                Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)
                //--------------------------------------------
                Divider()
                Text("Complited Badges")
                    .font(.title2)
                    .bold()
                ScrollView(.horizontal) {
                    HStack {
                        HikeBadge(name: "Fist Hike")
                        HikeBadge(name: "Earth Day")
                            .hueRotation(Angle(degrees: 90))
                        HikeBadge(name: "Tenth Hike")
                            .grayscale(0.5)
                            .hueRotation(Angle(degrees: 45))
                    }
                    .padding(.horizontal)
                }
                //--------------------------------------------
                Divider()
                Text("Recent Hikes")
                HikeView(hike: modelData.hikes[0])
            }
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
            .environmentObject(ModelData())
    }
}
