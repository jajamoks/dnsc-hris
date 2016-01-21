<?php

namespace DNSCHumanResource\Http\Middleware;

use Closure;

class EmployeeMiddleware {
	/**
	 * Handle an incoming request.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  \Closure  $next
	 * @return mixed
	 */
	public function handle($request, Closure $next) {
		if (auth()->user()->employee) {
			return $next($request);
		}
		flash()->error("You haven't filled up your PDS yet.");
		return redirect()->to('/');
	}
}
