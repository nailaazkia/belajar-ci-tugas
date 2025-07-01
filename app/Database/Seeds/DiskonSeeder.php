<?php

namespace App\Database\Seeds;

use CodeIgniter\Database\Seeder;

class DiskonSeeder extends Seeder
{
    public function run()
    {
        $this->db->table('diskon')->truncate();

        $data = [
            [
                'tanggal' => '2025-06-25',
                'nominal' => '1000',
                'created_at' => date('Y-m-d H:i:s'),
                'updated_at' => null,
            ],
            [
                'tanggal' => '2025-06-26',
                'nominal' => '1500',
                'created_at' => date('Y-m-d H:i:s'),
                'updated_at' => null,
            ],
            [
                'tanggal' => '2025-06-27',
                'nominal' => '1700',
                'created_at' => date('Y-m-d H:i:s'),
                'updated_at' => null,
            ],
            [
                'tanggal' => '2025-06-28',
                'nominal' => '2000',
                'created_at' => date('Y-m-d H:i:s'),
                'updated_at' => null,
            ],
            ['tanggal' => '2025-06-29',
                'nominal' => '2100',
                'created_at' => date('Y-m-d H:i:s'),
                'updated_at' => null,
            ],
            [
                'tanggal' => '2025-06-30',
                'nominal' => '2300',
                'created_at' => date('Y-m-d H:i:s'),
                'updated_at' => null,
            ],
            [
                'tanggal' => '2025-07-01',
                'nominal' => '2500',
                'created_at' => date('Y-m-d H:i:s'),
                'updated_at' => null,
            ],
            [
                'tanggal' => '2025-07-02',
                'nominal' => '2700',
                'created_at' => date('Y-m-d H:i:s'),
                'updated_at' => null,
            ],
            [
                'tanggal' => '2025-06-03',
                'nominal' => '2900',
                'created_at' => date('Y-m-d H:i:s'),
                'updated_at' => null,
            ],
            ['tanggal' => '2025-06-04',
                'nominal' => '3000',
                'created_at' => date('Y-m-d H:i:s'),
                'updated_at' => null,
            ],
 
        ];

        // Gunakan ignore(true) untuk melewati error duplikat (jika ada)
        $this->db->table('diskon')->ignore(true)->insertBatch($data);
    }
}