package controle_viagens

class AreaRestritaController {

    def index() {
		
	
	}
	
	
	def logar(){
	
	//render(view:"/areaRestrita/logar")
		
}

def admin(){
	
	//render(view:"/areaRestrita/admin")
	
}




def error(){
	
	redirect(action: "logar")

		
}
}
