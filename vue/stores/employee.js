export default {

	employees: [],

	init() {

		this.employees = Vue.get('/api/employees').success(function(response) {
			return response.data
		})

	},

	all() {

		return this.employees;

	}

}