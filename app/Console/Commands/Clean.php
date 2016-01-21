<?php

namespace DNSCHumanResource\Console\Commands;

use Artisan;
use Illuminate\Console\Command;

class Clean extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'clean';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Clean the application.';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        Artisan::call('view:clear');
        $this->info('Compiled views clear!');
        Artisan::call('config:clear');
        $this->info('Configuration cache cleared!');
        Artisan::call('cache:clear');
        $this->info('Application cache cleared!');
    }
}
