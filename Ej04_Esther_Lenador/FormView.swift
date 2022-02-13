

import SwiftUI

class UserInfo: ObservableObject {
    @Published var name = ""
    @Published var surname = ""
    @Published var job = ""
    @Published var phone = ""
    @Published var email = ""
    @Published var adress = ""
}

struct FormView: View {
    @EnvironmentObject var userInfo: UserInfo
    
    
    var body: some View {
        
        VStack (alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: .none ) {
            ZStack (alignment: .bottom){
                Image("card")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: 200)
                    .edgesIgnoringSafeArea(.top)
                
                Text("Diseña tu tarjeta de visita")
                    .font(Font.custom(("Montserrat-Light"), size: 30))
                    .shadow(color: .gray, radius: 1, x:0.1, y: 1)
            }
            
            Form {
                Section {
                    Text("Información personal")
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                        .font(Font.custom(("Montserrat-Medium"), size: 20))
                    TextField("Nombre", text: $userInfo.name)
                    TextField("Apellidos", text:$userInfo.surname)
                    TextField("Puesto de trabajo", text:$userInfo.job)
                }
                Section{
                    Text("Datos de contacto")
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                        .font(Font.custom(("Montserrat-Medium"), size: 20))
                    TextField("Teléfono", text:$userInfo.phone)
                    TextField("Email", text:$userInfo.email)
                    TextField("Dirección", text:$userInfo.adress)
                }
                
            } .font(Font.custom("Montserrat-Light", size: 20))
        }
              
        
        
    }
}
func checkName(){
    for family: String in UIFont.familyNames
    {
        print(family)
        for names: String in UIFont.fontNames(forFamilyName: family)
        {
            print("== \(names)")
        }
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}

