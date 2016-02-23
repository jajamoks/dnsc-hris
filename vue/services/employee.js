import {http} from './http';

export default {

	all() {
		Vue.$http.get('/api/employees')
			.then((employees) => {
				console.log(JSON.stringify(employees));
			})
	}

}