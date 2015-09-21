package controle_viagens

class Endereco {

	Integer	id
	String	cep
	String	descricao
	String	logradouro
	String	numero
	String	complemento
	String	bairro
	String	municipio
	String	uf

	static constraints = {
		cep (blank:false, size: 8..8)
		descricao(blank:false)
		logradouro (blank:false)
		numero (blank:false)
		complemento (nullable:true, blank:true)
		bairro (blank:false)
		municipio (blank:false)
		uf (blank:false, widget:'select', inList: ['AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MT', 'MS', 'MG', 'PA', 'PB', 'PR', 'PE', 'PI', 'RJ', 'RN', 'RS', 'RO', 'RR', 'SC', 'SP', 'SE', 'TO'])
	}

	static mapping = { version false }
	
	String toString() { "${descricao}, ${municipio}-${uf}" }
}
