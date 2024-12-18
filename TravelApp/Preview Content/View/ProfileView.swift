//
//  ProfileView.swift
//  TravelApp
//
//  Created by Lazizbek Fayzullayev on 12/12/24.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectedTab = 0
    @State private var username: String = "Lazizbek"
    
    let tabs = ["TRIPS", "PLACES", "MAPS", "VEHICLES", "REVIEWS"]
    
    var body: some View {
        VStack(spacing: 0) {
            // Background Image with Profile
            ZStack {
                // Background Image
                Image("road_background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .clipped()
                
                // Settings Button
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            // Add settings action
                        }) {
                            Image(systemName: "gearshape")
                                .foregroundColor(.white)
                                .font(.system(size: 22))
                                .padding()
                        }
                    }
                    Spacer()
                }
                
                // Profile Image and Camera Button
                VStack {
                    Spacer()
                    ZStack(alignment: .bottomTrailing) {
                        Circle()
                            .fill(Color("ProfileGreen")) // Light green color
                            .frame(width: 80, height: 80)
                            .overlay(
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .padding(20)
                                    .foregroundColor(.white)
                            )
                        
                        // Camera Button
                        Circle()
                            .fill(Color.white)
                            .frame(width: 32, height: 32)
                            .overlay(
                                Image(systemName: "camera")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16))
                            )
                            .offset(x: 5, y: 5)
                    }
                    .offset(y: 40)
                }
            }
            
            // Username
            Text(username)
                .font(.title3)
                .fontWeight(.medium)
                .padding(.top, 45)
            
            // Tab Bar
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 25) {
                    ForEach(tabs.indices, id: \.self) { index in
                        VStack(spacing: 8) {
                            Text(tabs[index])
                                .font(.system(size: 14))
                                .foregroundColor(selectedTab == index ? .blue : .gray)
                            
                            Rectangle()
                                .frame(height: 2)
                                .foregroundColor(selectedTab == index ? .blue : .clear)
                        }
                        .onTapGesture {
                            selectedTab = index
                        }
                    }
                }
                .padding(.horizontal)
            }
            .padding(.top, 15)
            
            // Content Area based on selected tab
            ScrollView {
                VStack(spacing: 20) {
                    switch selectedTab {
                    case 0: // TRIPS
                        EmptyStateView(
                            title: "Start trips",
                            message: "You don't have any trips yet. You can start trips with others or on your own.",
                            buttonTitle: "Start New Trip",
                            buttonIcon: "car",
                            buttonColor: .green
                        )
                    case 1: // PLACES
                        EmptyStateView(
                            title: "Save places",
                            message: "You haven't saved any places yet. Your saved places will be listed here.",
                            showButton: false
                        )
                    case 2: // MAPS
                        EmptyStateView(
                            title: "Offline Maps",
                            message: "Save up to five maps offline. More countries and regions coming soon!",
                            buttonTitle: "",
                            showButton: false
                        )
                    case 3: // VEHICLES
                        EmptyStateView(
                            title: "Vehicles",
                            message: "Add vehicles to your profile to see vehicle-specific routes and fuel costs for your trips.",
                            showButton: false
                        )
                    case 4: // REVIEWS
                        EmptyStateView(
                            title: "Review places",
                            message: "You haven't left any reviews yet. Help your fellow roadtrippers by reviewing places.",
                            showButton: false
                        )
                    default:
                        EmptyView()
                    }
                }
                .padding(.top, 40)
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

// Empty State View Component
struct EmptyStateView: View {
    let title: String
    let message: String
    var buttonTitle: String = ""
    var buttonIcon: String = ""
    var buttonColor: Color = .blue
    var showButton: Bool = true
    var showFloatingButton: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack(spacing: 16) {
                Text(title)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top, 40)
                
                Text(message)
                    .font(.body)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                
                if showButton {
                    Button(action: {}) {
                        HStack {
                            if !buttonIcon.isEmpty {
                                Image(systemName: buttonIcon)
                            }
                            Text(buttonTitle)
                        }
                        .foregroundColor(.white)
                        .padding(.horizontal, 30)
                        .padding(.vertical, 12)
                        .background(buttonColor)
                        .cornerRadius(25)
                    }
                    .padding(.top, 10)
                }
                
                Spacer()
            }
            
            if showFloatingButton {
                Button(action: {}) {
                    Image(systemName: "plus")
                        .font(.title2)
                        .foregroundColor(.white)
                        .frame(width: 60, height: 60)
                        .background(Color.blue)
                        .clipShape(Circle())
                }
                .padding(.trailing, 20)
                .padding(.bottom, 100)
            }
        }
        .frame(maxHeight: .infinity)
    }
}

#Preview {
    ProfileView()
}
