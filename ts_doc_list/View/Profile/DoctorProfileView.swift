//  Created by Emilio

import SwiftUI

struct ProfileDoctorView: View {
    @State var block: Doctor
    @State private var text: String = ""
    @Binding var path: NavigationPath
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 16) {
                HStack(spacing: 0) {
                    Button {
                        dismiss()
                    } label: {
                        Image(.arrow)
                            .resizable()
                            .frame(width: 12, height: 21)
                    }
                    
                    Spacer()
                    
                    Text(block.specialization?.first?.name ?? "Врач")
                        .font(.system(size: 20, weight: .medium))
                    
                    Spacer()
                    
                    Rectangle()
                        .frame(width: 12, height: 21)
                        .foregroundStyle(.clear)
                }
                
                VStack(alignment: .leading) {
                    DoctorAvatarView(block: block)
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Image(.timeout)
                            .resizable()
                            .frame(width: 22, height: 22)
                        
                        Text("Опыт работы: \(block.seniorityString) лет")
                            .font(.system(size: 12, weight: .regular))
                            .foregroundStyle(.gray)
                    }
                    
                    HStack {
                        Image(.medic)
                            .resizable()
                            .frame(width: 24, height: 24)
                        
                        Text("Категория: \(block.scientificDegreeLabel ?? "Врач")")
                            .font(.system(size: 12, weight: .regular))
                            .foregroundStyle(.gray)
                    }
                    
                    HStack {
                        Image(.graduation)
                            .resizable()
                            .frame(width: 24, height: 24)
                        
                        Text(block.higherEducation.first?.university ?? "ВУЗ не указан")
                            .font(.system(size: 12, weight: .regular))
                            .foregroundStyle(.gray)
                    }
                    
                    HStack {
                        Image(.location)
                            .resizable()
                            .frame(width: 24, height: 24)
                        
                        Text("Клиника неизвестна")
                            .font(.system(size: 12, weight: .regular))
                            .foregroundStyle(.gray)
                    }
                }
                
                VStack {
                    Button {
                        path.append(DoctorPriceDestination(doctor: block))
                    } label: {
                        HStack {
                            Text("Стоимость услуг")
                                .font(.system(size: 16, weight: .semibold))
                            
                            Spacer()
                            
                            PriceLabel(price: block.sortablePrice)
                        }
                        .padding(.horizontal, 16)
                    }
                    .buttonStyle(.plain)
                }
                .frame(height: 60)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.gray.opacity(0.2), lineWidth: 1)
                }
                
                Text("Проводит диагностику и лечение терапевтических больных. Осуществляет расшифровку и снятие ЭКГ. Дает рекомендации по диетологии. Доктор имеет опыт работы в России и зарубежом. Проводит консультации пациентов на английском языке")
                    .font(.system(size: 16, weight: .regular))
                    .kerning(-1)
                    .lineSpacing(10)
                
                Spacer()
                
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
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding(.horizontal, 16)
        .background(.colorBG)
        .zIndex(1)
    }
}
