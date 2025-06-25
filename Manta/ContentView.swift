//
//  ContentView.swift
//  Manta
//
//  Created by Priyan Rai on 25/06/25.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var cameraPosition = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 39.1031, longitude: -84.5120), span: MKCoordinateSpan(latitudeDelta: 0.025, longitudeDelta: 0.025)))

    var body: some View {
        TabView {
            // First tab: your existing content replaced with ZStack with top-right buttons
            ZStack(alignment: .topTrailing) {
                // Top-right buttons
                HStack(spacing: 16) {
                    Button(action: { /* Button 1 action */ }) {
                        Image(systemName: "bell")
                            .font(.system(size: 22))
                            .foregroundColor(.primary)
                            .frame(width: 44, height: 44)
                            .background(RoundedRectangle(cornerRadius: 14).fill(Color(.systemBackground)).shadow(radius: 4))
                    }
                    Button(action: { /* Button 2 action */ }) {
                        Image(systemName: "gearshape")
                            .font(.system(size: 22))
                            .foregroundColor(.primary)
                            .frame(width: 44, height: 44)
                            .background(RoundedRectangle(cornerRadius: 14).fill(Color(.systemBackground)).shadow(radius: 4))
                    }
                }
                .padding(.top, 8)
                .padding(.trailing, 32)

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
                    .frame(maxWidth: .infinity, maxHeight: 280)
                    .padding(.horizontal, 24)

                    // Bottom row of two square cards
                    HStack(spacing: 20) {
                        // First Card
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(.black.opacity(0.8)))
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
                                .fill(Color(.black.opacity(0.5)))
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
                .padding(.vertical, 30)
                .padding(.top, 220)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }
            .tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            // Second tab
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
