<?php

use Illuminate\Database\Seeder;
use App\Models\Item;

class ItemSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run(EloquentPopulator\Populator $populator)
    {

        $populator->add(Item::class, 5);
        $insertedPKs = $populator->seed();
    }
}
