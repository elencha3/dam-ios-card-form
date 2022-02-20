

import SwiftUI

//Class UserInfo to store info from form. Type ObservableObject to share info with the app
class UserInfo: ObservableObject {
    @Published var name = ""
    @Published var surname = ""
    @Published var job = ""
    @Published var phone = ""
    @Published var email = ""
    @Published var adress = ""
}

struct FormView: View {
    
    //Var to store userInfo fields
    @EnvironmentObject var userInfo: UserInfo
    
    var body: some View {
        
        VStack (alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: .none ) {
            
            /*BANNER WITH TITLE AND IMAGE*/
            ZStack (alignment: .bottom){
                Image("card")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: 200)
                    .edgesIgnoringSafeArea([.top,.leading,.trailing])
                Text("Diseña tu tarjeta de visita")
                    .font(Font.custom(("Montserrat-Light"), size: 30))
                    .shadow(color: .gray, radius: 1, x:0.1, y: 1)
            }
            /*FORM WITH TWO SECTIONS (INFO & CONTACT) TO CREATE CARD*/
            Form {
                Section {
                    Text("Información personal")
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                        .font(Font.custom(("Montserrat-Medium"), size: 20))
                        .foregroundColor(.yellow)
                        .shadow(color: .gray, radius: 0.3, x:0.1, y: 1)
                        
                    TextField("Nombre", text: $userInfo.name)
                    TextField("Apellidos", text:$userInfo.surname)
                    TextField("Puesto de trabajo", text:$userInfo.job)
                }
                Section{
                    Text("Datos de contacto")
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                        .font(Font.custom(("Montserrat-Medium"), size: 20))
                        .foregroundColor(.yellow)
                        .shadow(color: .gray, radius: 0.3, x:0.1, y: 1)
                    TextField("Teléfono", text:$userInfo.phone)
                    TextField("Email", text:$userInfo.email)
                    TextField("Dirección", text:$userInfo.adress)
                }
            } .font(Font.custom("Montserrat-Light", size: 20))
        }
    }
}



struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}

