//
//  ContentView.swift
//  TravelApp
//
//  Created by Lazizbek Fayzullayev on 12/12/24.
//

import SwiftUI
import MapKit

struct ContainerView: View {
    var body: some View {
        TabView {
            TripView()
                .tabItem {
                    Label("Trip", systemImage: "airplane")
                }

            AlertView()
                .tabItem {
                    Label("Alert", systemImage: "bell")
                }

            MapView()
                .tabItem {
                    Label("Map", systemImage: "map")
                }

            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
        .onAppear {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor.white
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
}

#Preview {
    ContainerView()
}
//import SwiftUI
//
//struct ContainerView: View {
//    var body: some View {
//        TabView {
//            TripView()
//                .tabItem {
//                    Label("Trip", systemImage: "bag.fill")
//                }
//
//            AlertsView()
//                .tabItem {
//                    Label("Alert", systemImage: "bell.fill")
//            }
//            MapView()
//                .tabItem {
//                    Label("Map", systemImage: "map.fill")
//            }
//            ProfileView()
//                .tabItem {
//                    Label("Profile", systemImage: "person.fill")
//            }
//        }
//    }
//}
//
//#Preview {
//    ContainerView()
//}
