//
//  ContentView.swift
//  Manta
//
//  Created by Priyan Rai on 25/06/25.
//

import SwiftUI
import MapKit
import SceneKit

struct ContentView: View {
    @State private var cameraPosition = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 39.1031, longitude: -84.5120), span: MKCoordinateSpan(latitudeDelta: 0.025, longitudeDelta: 0.025)))
    @State private var showSettingsSheet = false
    @State private var searchText = ""

    var body: some View {
        TabView {
            
            
            // First tab: your existing content replaced with ZStack with top-right buttons
            ZStack(alignment: .top) {
                
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        HStack(spacing: 12) {
                            Image("Manta")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                                .clipped()
                        }
                        .padding(.leading, 32)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .zIndex(1)
                        Spacer()
                        // Bell and settings buttons (top right)
                        HStack(spacing: 16) {
                            Button(action: { /* Button 1 action */ }) {
                                Image(systemName: "bell")
                                    .font(.system(size: 22))
                                    .foregroundColor(.primary)
                                    .frame(width: 44, height: 44)
                                    .background(RoundedRectangle(cornerRadius: 14).fill(Color(.systemBackground)).shadow(radius: 4))
                            }
                            Button(action: { showSettingsSheet = true }) {
                                Image(systemName: "gearshape")
                                    .font(.system(size: 22))
                                    .foregroundColor(.primary)
                                    .frame(width: 44, height: 44)
                                    .background(RoundedRectangle(cornerRadius: 14).fill(Color(.systemBackground)).shadow(radius: 4))
                            }
                        }
                        .padding(.trailing, 32)
                    }
                    .padding(.top, 10)

                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.secondary)
                        TextField("Search for address, kiosk, or items...", text: $searchText)
                            .textFieldStyle(PlainTextFieldStyle())
                    }
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color(.systemGray6)))
                    .padding(.horizontal, 32)
                    .padding(.top,20)
                }
                
                // Main content
                VStack(spacing: 20) {
                    // Top rectangular card with map and overlayed text
                    ZStack(alignment: .topLeading) {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(.systemBackground))
                            .shadow(radius: 8)
                        Map(position: $cameraPosition, interactionModes: .all)
                            .mapStyle(.standard(elevation: .realistic))
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .padding(8)
                        HStack {
                            Text("Find Nearby Kiosks.")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.primary)
                                .padding(.horizontal, 14)
                                .padding(.vertical, 6)
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .fill(Color(.systemBackground).opacity(0.85))
                                .shadow(radius: 2)
                        )
                        .padding(.top, 18)
                        .padding(.leading, 18)
                    }
                    .frame(maxWidth: .infinity, maxHeight: 400)
                    .padding(.horizontal, 24)

                    // Bottom row of two square cards
                    HStack(spacing: 20) {
                        // First Card
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(.green.opacity(0.8)))
                                .shadow(radius: 20)
                            Image("Pickup")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 120, height: 120)
                                .accessibilityLabel("Pickup")

                            VStack {
                                Spacer()
                                HStack {
                                    Text("Pickup")
                                        .font(.system(size: 16, weight: .bold))
                                        .foregroundColor(.primary)
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 4)
                                        .background(
                                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                                .fill(Color(.systemBackground).opacity(0.85))
                                                .shadow(radius: 2)
                                        )
                                    Spacer()
                                }
                                .padding([.leading, .bottom], 12)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .aspectRatio(1, contentMode: .fit)
                        
                        // Second Card
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(.blue.opacity(0.5)))
                                .shadow(radius: 20)
                            Image("Dropoff")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 140, height: 140)
                                .accessibilityLabel("Dropoff")

                            VStack {
                                Spacer()
                                HStack {
                                    Text("Dropoff")
                                        .font(.system(size: 16, weight: .bold))
                                        .foregroundColor(.primary)
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 4)
                                        .background(
                                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                                .fill(Color(.systemBackground).opacity(0.85))
                                                .shadow(radius: 2)
                                        )
                                    Spacer()
                                }
                                .padding([.leading, .bottom], 12)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .aspectRatio(1, contentMode: .fit)
                    }
                    .padding(.horizontal, 24)
                }
                .padding(.top, 150)
                .padding(.vertical, 30)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }
            .tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            
            // FBX drone model viewer - interactive
            // Second tab
            VStack(spacing: 18) {
                Text("Manta Prototype 2")
                    .font(.title2)
                    .bold()
                    .padding(.top, 24)
                Drone3DView()
                    .frame(height: 600)
                    .cornerRadius(18)
                    .padding(.horizontal, 24)
                    .accessibilityLabel("Interactive 3D drone model")
                Spacer()
            }
            .tabItem {
                Image(systemName: "paperplane.fill")
                Text("Drones")
            }
            
            // Third tab
            VStack {
                Image(systemName: "person.crop.circle")
                    .font(.system(size: 64))
                    .padding(.top, 120)
                Text("Profile")
                    .font(.largeTitle)
                    .padding()
                Spacer()
            }
            .tabItem {
                Image(systemName: "train.side.rear.car")
                Text("Kiosks")
            }
            
            // Fourth tab
            VStack {
                Image(systemName: "person.crop.circle")
                    .font(.system(size: 64))
                    .padding(.top, 120)
                Text("Profile")
                    .font(.largeTitle)
                    .padding()
                Spacer()
            }
            .tabItem {
                Image(systemName: "person")
                Text("Profile")
            }
        }
    }
}



#Preview {
    ContentView()
}

struct Previews_ContentView_LibraryContent: LibraryContentProvider {
    var views: [LibraryItem] {
        LibraryItem(/*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/)
    }
}
