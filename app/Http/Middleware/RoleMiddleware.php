<?php

namespace DNSCHumanResource\Http\Middleware;

use Closure;

class RoleMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next, $position)
    {
        dd($position);
        if ($request->user()->positions->contains('name', $position)) {
            return $next($request);
        }
        abort(401);
    }
}
