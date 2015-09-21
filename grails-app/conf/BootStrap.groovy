import comum.Permissao;
import comum.Usuario;
import comum.UsuarioPermissao;

class BootStrap {

    def init = { servletContext ->
		
		Permissao admin = Permissao.findByAuthority('ROLE_ADMIN')
		
			if (admin == null) {
				admin = new Permissao(authority: 'ROLE_ADMIN').save(flush: true)
			}
		
			Permissao user = Permissao.findByAuthority('ROLE_USER')
			
			if (user == null) {
				user = new Permissao(authority: 'ROLE_USER').save(flush: true)
			}
			
			Usuario administrador = Usuario.findByUsername('administrador') //criando usuario administrador
		
			if (administrador == null) {
				administrador = new Usuario(username: "administrador", password: "123",
					enable: true, accountExpired: false, accountLocked: false,
					passwordExpired: false).save(flush: true)
			}
			
			Usuario servidor = Usuario.findByUsername('servidor') //criando usuario servidor
			
			if (servidor == null) {
				servidor = new Usuario(username: "servidor", password: "123",
					enable: true, accountExpired: false, accountLocked: false,
					passwordExpired: false).save(flush: true)
			}
	
			if (UsuarioPermissao.findByUsuarioAndPermissao(administrador,admin) ==  null ) {
				new UsuarioPermissao(usuario: administrador,permissao: admin).save(flush: true)
			}
			
			if (UsuarioPermissao.findByUsuarioAndPermissao(servidor,user) ==  null ) {
				new UsuarioPermissao(usuario: servidor,permissao: user).save(flush: true)
			}
		
    }
    def destroy = {
    }
}
