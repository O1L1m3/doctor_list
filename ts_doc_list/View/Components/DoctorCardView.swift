//  Created by Emilio

import SwiftUI

struct DoctorCardView: View {
    
    @Binding var path: NavigationPath
    @State private var isFavorite = false
    var block: Doctor
    
    var body: some View {
        VStack(alignment: .leading) {
            Button {
                path.append(block)
            } label: {
                VStack(alignment: .leading) {
                    HStack(spacing: 12) {
                        DoctorAvatarView(block: block)
                        
                        Spacer()
                        
                        VStack{
                            Button {
                                withAnimation(.easeInOut(duration: 0.2)) {
                                    isFavorite.toggle()
                                }
                            } label: {
                                Image(systemName: isFavorite ? "heart.fill" : "heart")
                                    .resizable()
                                    .frame(width: 24, height: 21)
                                    .foregroundStyle(isFavorite ? .colorPink : .gray)
                                    .animation(.easeInOut(duration: 0.2), value: isFavorite)
                            }
                            
                            Rectangle()
                                .frame(width: 26)
                                .foregroundColor(.clear)
                        }
                    }
                    
                    HStack(spacing: 0){
                        Rectangle()
                            .frame(width: 66, height: 10)
                            .foregroundStyle(.clear)
                        
                        VStack(alignment: .leading, spacing: 12){
                            StarRatingView(rating: block.rating)
                            
                            HStack(spacing: 4) {
                                Text("\(block.mainSpecialty) • \(block.seniorityString)")
                                    .font(.system(size: 13))
                                    .foregroundColor(.gray)
                            }
                            .padding(.bottom, 7)
                            
                            PriceLabel(price: block.sortablePrice)
                        }
                    }
                    .padding(.bottom, 13)
                }
            }
            .buttonStyle(.plain)
            
            VStack(spacing: 0) {
                AppointmentButton(isAvailable: !block.freeReceptionTime.isEmpty) {
                    if !block.freeReceptionTime.isEmpty {
                        path.append(DoctorPriceDestination(doctor: block))
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.bottom, 16)
        }
        .frame(maxWidth: .infinity, maxHeight: 224, alignment: .topLeading)
        .padding(.horizontal, 16)
        .padding(.top, 20)
        .background(.white)
        .cornerRadius(8)
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(.gray.opacity(0.2), lineWidth: 1)
        }
    }
}
