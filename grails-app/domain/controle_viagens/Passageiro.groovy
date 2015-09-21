package controle_viagens

class Passageiro {

	Integer id
	String nome
	String cpf
	String telefone
	String email
	Endereco endereco

	static constraints = {
		nome (blank:false)
		cpf (blank:false, size: 11..11, matches: "[0-9]+")
		telefone(blank:false, size: 10..11, matches: "[0-9]+")
		email (blank:false, email:true)
		endereco (blank:false)
	}

	static mapping = { version false }

	String toString() { "${nome}" }
}
