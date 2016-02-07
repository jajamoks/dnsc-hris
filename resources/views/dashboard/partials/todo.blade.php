<hris-todo inline-template>
	<div class="panel">
		<div class="panel-heading">
			<div class="panel-control">
				<span class="label label-success">@{{ todos.length | pluralize 'todo' }}</span>
				<div class="btn-group">
					<button class="dropdown-toggle btn" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-gear"></i></button>
					<ul class="dropdown-menu dropdown-menu-right">
						<li><a href="javascript:void(0)" v-on:click="filterTodoBy = ''">{{ trans('system.show-all') }}</a></li>
						<li><a href="javascript:void(0)" v-on:click="filterTodoBy = true">{{ trans('system.show-done') }}</a></li>
						<li><a href="javascript:void(0)" v-on:click="filterTodoBy = false">{{ trans('system.show-undone') }}</a></li>
						<li class="divider"></li>
						<li><a @click="destroyAllTodos" href="javascript:void(0)">{{ trans('system.clear-todos') }}</a></li>
						<li class="refresh" data-toggle="panel-overlay" data-target="#todo-list"><a v-on:click="refreshTodos" href="javascript:void(0)">Refresh</a></li>
					</ul>
					<button class="btn btn-default" type="button" data-toggle="collapse" data-target="#todo-list"><i class="fa fa-chevron-down"></i></button>
				</div>
			</div>
			<h3 class="panel-title">{{ trans('system.todo-list') }}</h3>
		</div>
		<div id="todo-list" class="collapse in">
			<div class="pad-ver">
				<div class="nano" style="height:320px">
					<div class="nano-content pad-no">
						<ul class="list-group bg-trans list-todo mar-no">
							<template v-for="todo in todos | filterBy filterTodoBy 'is_done' | orderBy 'created_at' -1">
								<li class="list-group-item">
									<label class="form-checkbox form-icon">
										<input @click="toggleDone(todo)" type="checkbox" :checked="todo.is_done" :disabled="editing">
										<span @click="editTodo(todo)">@{{ todo.todo }}</span>
									</label>
								</li>
							</template>
						</ul>
						<div v-if="!todos.length" class="cls-container bg-trans">
						    <div class="cls-content">
						        <h1 class="text-light"><i class="fa fa-calendar fa-5x"></i></h1>
						        <p class="h4 text-muted pad-btm text-thin">
						            {{ trans('system.empty-todo') }}
						        </p>
						    </div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<form @submit.prevent="editing ? updateTodo(todo) : storeTodo(todo)">
			<div class="input-group pad-all">
				<input maxlength="75" v-el="todoInput" v-model="todo.todo" type="text" class="form-control" placeholder="{{ trans('system.new-task') }}">
				<span class="input-group-btn">
					<button data-style="expand-right" type="submit" class="ladda-button btn btn-success"><i class="fa fa-plus"></i></button>
				</span>
			</div>
		</form>
	</div>
</hris-todo>
