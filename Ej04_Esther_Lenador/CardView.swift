

import SwiftUI

struct CardView: View {
    @EnvironmentObject var userInfo: UserInfo
    
    @State private var bgColor = Color(.systemIndigo)
    @State private var fgColor = Color(.black)
    @State private var bgCircleColor = Color(.white)
    @State var fontArray = ["PartyLetPlain", "Helvetica","Palatino-Roman", "NotoNastaliqUrdu", "Kailasa"]
    
    
    @State var colorArray = [
        Color(.systemIndigo),
        Color(.systemGreen),
        Color(.systemTeal),
        Color(.systemPink),
        
    ]
    
    @State private var selectedIndex = 0
    @State private var customFont = "Montserrat-Medium"
    
    @State var flipped = false // state variable used to update the card
    
    
    var body: some View {
        VStack  {
            Text("Personaliza tu tarjeta")
                .font(Font.custom("Montserrat-Light", size: 30))
                .padding(.top,30)
            ZStack {
                VStack {
                    Text(userInfo.name.prefix(1))
                        .font(.largeTitle)
                        .frame(width: 80, height: 80)
                        .background(bgCircleColor)
                        .clipShape(Circle())
                        .padding()
                    Spacer().frame(height:10)
                    VStack(alignment: .leading) {
                        if !flipped {
                            Text(userInfo.name + " " + userInfo.surname)
                            Text(userInfo.job)
                        } else {
                            Text(userInfo.phone)
                            Text(userInfo.email)
                            Text(userInfo.adress)
                        }
                    }
                }.frame(width:300, height: 200)
                .foregroundColor(fgColor)
                .background(bgColor)
                .cornerRadius(16)
                .shadow(color: Color.gray, radius: 16, x:14, y:14)
                .rotation3DEffect(Angle(degrees:self.flipped ? 180 : 0), axis: (x:0,y:1,z:0))
                .onTapGesture {
                    withAnimation(.easeIn(duration: 0.5)){
                        self.flipped.toggle()
                    }
                }
            }.padding(.top, 20)
            .font(Font.custom(customFont, size: 20))
            .rotation3DEffect(Angle(degrees:self.flipped ? 180 : 0), axis: (x:0,y:1,z:0))
            .onTapGesture {
                withAnimation(.easeIn(duration: 0.5)){
                    self.flipped.toggle()
                }
            }
            Divider().frame(height: 40)
               
            
            VStack {
                Text("Colores").frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 30, alignment: .leading)
                    .padding(.horizontal, 20)
                    .font(Font.custom("Montserrat-Medium", size: 20))
                HStack {
                    ForEach(colorArray, id:\.self) { color in
                        Circle()
                            .frame(width:50, height:50)
                            .foregroundColor(color)
                            .onTapGesture {
                                bgColor = color
                            }
                    }
                }
                VStack {
                    ColorPicker("Más colores de fondo", selection: $bgColor).frame(width:300, height:30)
                    ColorPicker("Color de texto", selection: $fgColor).frame(width:300, height:20).padding(.bottom, 5)
                    ColorPicker("Color de círculo", selection: $bgCircleColor).frame(width:300, height:20)
                }.font(Font.custom("Montserrat-Light", size: 15))
                .padding(.top,10)
            }
            VStack {
                Text("Fuentes").frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 30, alignment: .leading)
                    .padding(.horizontal,20)
                    .font(Font.custom("Montserrat-Medium", size: 20))
                HStack {
                    Text(customFont)
                    Spacer()
                    Picker("Cambiar", selection:$customFont) {
                        ForEach(fontArray, id:\.self) {
                            Text($0)
                        }
                    }.pickerStyle(MenuPickerStyle())
                }
                .font(Font.custom("Montserrat-Light", size: 15))
                .padding(.horizontal,20)
                
            }.padding(.top, 30)
            Spacer()
            
        }.font(Font.custom("Montserrat-Light", size: 20))
    }
}




struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
