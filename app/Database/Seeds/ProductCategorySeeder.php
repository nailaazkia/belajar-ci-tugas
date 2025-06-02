<?php

namespace App\Database\Seeds;

use CodeIgniter\Database\Seeder;

class ProdukCategorySeeder extends Seeder
{
    public function run()
    {
        $this->db->table('product_categories')->truncate();

        $data = [
            [
                'name' => 'Gelang',
                'slug' => 'gelang',
                'description' => 'All Bracelet Product',
                'parent_id' => null,
                'is_active' => 1,
                'created_at' => date('Y-m-d H:i:s'),
            ],
            [
                'name' => 'Kalung',
                'slug' => 'kalung',
                'description' => 'All Necklace Product',
                'parent_id' => 1, 
                'is_active' => 1,
                'created_at' => date('Y-m-d H:i:s'),
            ],
            [
                'name' => 'Keychain',
                'slug' => 'keychain',
                'description' => 'All Keychain Product',
                'parent_id' => 2, 
                'is_active' => 1,
                'created_at' => date('Y-m-d H:i:s'),
            ],
        ];

        // Gunakan ignore(true) untuk melewati error duplikat (jika ada)
        $this->db->table('product_categories')->ignore(true)->insertBatch($data);
    }
}