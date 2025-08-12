import SwiftUI

struct DoctorPriceView: View {
    let block: Doctor
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            HStack(spacing: 0) {
                Button {
                    dismiss()
                } label: {
                    Image(.arrow)
                        .resizable()
                        .frame(width: 12, height: 21)
                }
                
                Spacer()
                
                Text("Стоимость услуг")
                    .font(.system(size: 20, weight: .medium))
                
                Spacer()
                
                Rectangle()
                    .frame(width: 12, height: 21)
                    .foregroundStyle(.clear)
            }
            
            VStack(alignment: .leading) {
                Text("Видеоконсультация")
                    .font(.headline)
                VStack {
                    HStack {
                        Text("30 мин")
                            .font(.subheadline)
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        Text("\(Int(block.videoChatPrice ?? 0)) ₽")
                            .font(.headline)
                        
                        
                    }
                    .padding(.horizontal, 16)
                }
                .frame(height: 60)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.gray.opacity(0.2), lineWidth: 1)
                }
            }
            
            VStack(alignment: .leading) {
                Text("Чат с врачом")
                    .font(.headline)
                VStack {
                    HStack {
                        Text("30 мин")
                            .font(.subheadline)
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        Text("\(Int(block.textChatPrice ?? 0)) ₽")
                            .font(.headline)
                        
                        
                    }
                    .padding(.horizontal, 16)
                }
                .frame(height: 60)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.gray.opacity(0.2), lineWidth: 1)
                }
            }
            
            VStack(alignment: .leading) {
                Text("Приём в клинике")
                    .font(.headline)
                VStack {
                    HStack {
                        Text("В клинике")
                            .font(.subheadline)
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        Text("\(Int(block.hospitalPrice ?? 0)) ₽")
                            .font(.headline)
                        
                        
                    }
                    .padding(.horizontal, 16)
                }
                .frame(height: 60)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.gray.opacity(0.2), lineWidth: 1)
                }
            }
            
            VStack(alignment: .leading) {
                Text("Вызов на дом")
                    .font(.headline)
                VStack {
                    HStack {
                        Text("На дом")
                            .font(.subheadline)
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        Text("\(Int(block.homePrice ?? 0)) ₽")
                            .font(.headline)
                        
                    }
                    .padding(.horizontal, 16)
                }
                .frame(height: 60)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.gray.opacity(0.2), lineWidth: 1)
                }
            }
            
            Spacer()
        }
        .padding(.horizontal)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .background(.colorBG)
    }
}

