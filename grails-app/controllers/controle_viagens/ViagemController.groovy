package controle_viagens

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ViagemController {

	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		def viagens = null

		if (params.keyword){
			viagens =  Viagem.createCriteria().list(params) {
				or{
					ilike ('objetivo', "%${params.keyword}%")
					ilike ('status', "%${params.keyword}%")
					sqlRestriction("DATE_FORMAT(ida,'%d/%m/%Y %H:%i') LIKE '%${params.keyword}%'")
					//sqlRestriction("to_char(ida, 'DD/MM/YYYY HH24:MI') LIKE '%${params.keyword}%'")
					sqlRestriction("DATE_FORMAT(volta,'%d/%m/%Y %H:%i') LIKE '%${params.keyword}%'")
					//sqlRestriction("to_char(volta, 'DD/MM/YYYY HH24:MI') LIKE '%${params.keyword}%'")
					passageiro{
						ilike('nome', "%${params.keyword}%")
					}
					origem{
						or{
							ilike('descricao', "%${params.keyword}%")
							ilike('municipio', "%${params.keyword}%")
							ilike('uf', "%${params.keyword}%")
						}
					}
					destino{
						or{
							ilike('descricao', "%${params.keyword}%")
							ilike('municipio', "%${params.keyword}%")
							ilike('uf', "%${params.keyword}%")
						}
					}
				}
			}

			if(viagens.size() == 0){
				flash.message = message(code: 'default.pesquisar.semresultado')
			}
		}
		else{
			viagens = Viagem.list(params)
		}

		respond viagens, model:[viagemInstanceCount: viagens.totalCount, keyword: params.keyword]
	}

	def show(Viagem viagemInstance) {
		respond viagemInstance
	}

	def create() {
		respond new Viagem(params)
	}

	@Transactional
	def save(Viagem viagemInstance) {
		if (viagemInstance == null) {
			notFound()
			return
		}

		if (viagemInstance.hasErrors()) {
			respond viagemInstance.errors, view:'create'
			return
		}

		viagemInstance.save flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.created.message', args: [
					message(code: 'viagem.label', default: 'Viagem'),
					viagemInstance.id
				])
				redirect viagemInstance
			}
			'*' { respond viagemInstance, [status: CREATED] }
		}
	}

	def edit(Viagem viagemInstance) {
		respond viagemInstance
	}

	@Transactional
	def update(Viagem viagemInstance) {
		if (viagemInstance == null) {
			notFound()
			return
		}

		if (viagemInstance.hasErrors()) {
			respond viagemInstance.errors, view:'edit'
			return
		}

		viagemInstance.save flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.updated.message', args: [
					message(code: 'viagem.label', default: 'Viagem'),
					viagemInstance.id
				])
				redirect viagemInstance
			}
			'*'{ respond viagemInstance, [status: OK] }
		}
	}
	
	@Transactional
	def alterarstatus(Viagem viagemInstance) {
		if (viagemInstance == null) {
			notFound()
			return
		}

		if (viagemInstance.hasErrors()) {
			respond viagemInstance.errors, view:'edit'
			return
		}
		
		viagemInstance.setStatus(params.status);

		viagemInstance.save flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.updated.message', args: [
					message(code: 'viagem.label', default: 'Viagem'),
					viagemInstance.id
				])
				
				redirect(action: "show", id:viagemInstance.id)
			}
			//'*'{ respond viagemInstance, [status: OK] }
		}
	}

	@Transactional
	def delete(Viagem viagemInstance) {

		if (viagemInstance == null) {
			notFound()
			return
		}

		viagemInstance.delete flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.deleted.message', args: [
					message(code: 'viagem.label', default: 'Viagem'),
					viagemInstance.id
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
					message(code: 'viagem.label', default: 'Viagem'),
					params.id
				])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}
}