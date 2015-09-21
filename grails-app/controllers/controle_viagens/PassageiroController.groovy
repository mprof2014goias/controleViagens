package controle_viagens



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PassageiroController {

	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		def passageiros = null

		if (params.keyword){
			passageiros =  Passageiro.createCriteria().list(params) {
				or{
					ilike('nome', "%${params.keyword}%")
					ilike('cpf', "%${params.keyword}%")
					endereco{
						or{
							ilike('descricao', "%${params.keyword}%")
							ilike('municipio', "%${params.keyword}%")
							ilike('uf', "%${params.keyword}%")
						}
					}
				}
			}

			if(passageiros.size() == 0){
				flash.message = message(code: 'default.pesquisar.semresultado')
			}
		}
		else{
			passageiros = Passageiro.list(params)
		}
		
		respond passageiros, model:[passageiroInstanceCount: passageiros.totalCount, keyword: params.keyword]
	}

	def show(Passageiro passageiroInstance) {
		respond passageiroInstance
	}

	def create() {
		respond new Passageiro(params)
	}

	@Transactional
	def save(Passageiro passageiroInstance) {
		if (passageiroInstance == null) {
			notFound()
			return
		}

		if (passageiroInstance.hasErrors()) {
			respond passageiroInstance.errors, view:'create'
			return
		}

		passageiroInstance.save flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.created.message', args: [
					message(code: 'passageiro.label', default: 'Passageiro'),
					passageiroInstance.id
				])
				redirect passageiroInstance
			}
			'*' { respond passageiroInstance, [status: CREATED] }
		}
	}

	def edit(Passageiro passageiroInstance) {
		respond passageiroInstance
	}

	@Transactional
	def update(Passageiro passageiroInstance) {
		if (passageiroInstance == null) {
			notFound()
			return
		}

		if (passageiroInstance.hasErrors()) {
			respond passageiroInstance.errors, view:'edit'
			return
		}

		passageiroInstance.save flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.updated.message', args: [
					message(code: 'Passageiro.label', default: 'Passageiro'),
					passageiroInstance.id
				])
				redirect passageiroInstance
			}
			'*'{ respond passageiroInstance, [status: OK] }
		}
	}

	@Transactional
	def delete(Passageiro passageiroInstance) {

		if (passageiroInstance == null) {
			notFound()
			return
		}

		passageiroInstance.delete flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.deleted.message', args: [
					message(code: 'Passageiro.label', default: 'Passageiro'),
					passageiroInstance.id
				])
				redirect action:"index", method:"GET"
			}
			'*'{ render status: NO_CONTENT }
		}
	}

	protected void notFound() {
		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.not.found.message', args: [
					message(code: 'passageiro.label', default: 'Passageiro'),
					params.id
				])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}
}
