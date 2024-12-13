//
//  ContentView.swift
//  TravelApp
//
//  Created by Lazizbek Fayzullayev on 12/12/24.
//
import SwiftUI
import MapKit

struct ContainerView: View {
    @State private var selectedTab: Tab = .profile

    // Enum for tabs
    enum Tab {
        case trip, alert, map, profile
    }

    var body: some View {
        ZStack {
            // Show content based on selected tab
            switch selectedTab {
            case .trip:
                TripView()
            case .alert:
                AlertView()
            case .map:
                MapView()
            case .profile:
                ProfileView()
            }

            // Custom Tab Bar
            VStack {
                Spacer()

                HStack {
                    // Trip Tab
                    TabBarButton(icon: "airplane", isSelected: selectedTab == .trip) {
                        selectedTab = .trip
                    }

                    Spacer()

                    // Alert Tab
                    TabBarButton(icon: "bell", isSelected: selectedTab == .alert) {
                        selectedTab = .alert
                    }

                    Spacer()

                    // Map Tab
                    TabBarButton(icon: "map", isSelected: selectedTab == .map) {
                        selectedTab = .map
                    }

                    Spacer()

                    // Profile Tab
                    TabBarButton(icon: "person", isSelected: selectedTab == .profile) {
                        selectedTab = .profile
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.white)
                        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
                )
                .padding(.horizontal)
            }
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

struct TabBarButton: View {
    let icon: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: icon)
                .font(.system(size: 24))
                .foregroundColor(isSelected ? Color.green : Color.gray)
                .padding(10)
        }
    }
}

#Preview {
    ContainerView()
}
//import SwiftUI
//import MapKit
//
//struct ContainerView: View {
//    var body: some View {
//        TabView {
//            TripView()
//                .tabItem {
//                    Label("Trip", systemImage: "airplane")
//                }
//
//            AlertView()
//                .tabItem {
//                    Label("Alert", systemImage: "bell")
//                }
//
//            MapView()
//                .tabItem {
//                    Label("Map", systemImage: "map")
//                }
//
//            ProfileView()
//                .tabItem {
//                    Label("Profile", systemImage: "person")
//                }
//        }
//        .onAppear {
//            let appearance = UITabBarAppearance()
//            appearance.configureWithOpaqueBackground()
//            appearance.backgroundColor = UIColor.white
//            UITabBar.appearance().standardAppearance = appearance
//            UITabBar.appearance().scrollEdgeAppearance = appearance
//        }
//    }
//}
//
//#Preview {
//    ContainerView()
//}
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
