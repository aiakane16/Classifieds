<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;
use App\Models\Item;

class ItemTest extends TestCase
{
    /**
     * Test if api can list items
     *
     * @return void
     */
    public function testListItem()
    {
        $response = $this->get('/api/items');

        $response
            ->assertStatus(200)
            ->assertSee(1);
    }

    public function testCreateItem(){
        $item = populator(Item::class)->make();

        $response = $this->postJson('/api/items',$item->toArray());

        $response
            ->assertStatus(201);
    }

    public function testShowItem(){
        $item = populator(Item::class)->create();

        $response = $this->get('/api/items/'. $item->id);

        $response->assertStatus(200);

    }

    public function testUpdateItem(){
        $item = populator(Item::class)->create();

        $itemUpdate = populator(Item::class)->make();

        $response = $this->putJson('/api/items/'. $item->id,$itemUpdate->toArray());

        $response->assertStatus(202);

    }

    public function testDeleteItem(){
        $item = populator(Item::class)->create();

        $response = $this->delete('/api/items/'. $item->id);

        $response->assertStatus(204);

    }
}
