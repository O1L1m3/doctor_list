import SwiftUI

struct DoctorAvatarView: View {
    
    let block: Doctor
    var imageSize: CGFloat = 50
    
    var body: some View {
        HStack {
            if let avatar = block.avatar, let url = URL(string: avatar) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    Color.gray
                }
                .frame(width: imageSize, height: imageSize)
                .clipShape(Circle())
                .clipped()
            } else {
                (block.avatar?.isEmpty == false ? Image(block.avatar!) : Image(systemName:"person"))
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageSize, height: imageSize)
                    .clipShape(Circle())
                    .foregroundStyle(.colorIconTabBar)
            }
            
            VStack(alignment: .leading, spacing: 0) {
                Text(block.firstName)
                    .font(.system(size: 16, weight: .semibold))
                    .padding(.bottom, 4)
                Text(block.lastName)
                    .font(.system(size: 16, weight: .semibold))
                    .padding(.bottom, 8)
            }
            .foregroundStyle(.black)
        }
    }
}
